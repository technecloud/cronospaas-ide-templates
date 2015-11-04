package security.oauth2.authcode;

import javax.json.*;
import java.io.*;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.*;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.glassfish.jersey.client.oauth2.OAuth2CodeGrantFlow;
import org.glassfish.jersey.client.oauth2.TokenResult;
import security.permission.AuthenticationServlet;

import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.NameValuePair;

import java.util.*;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import java.io.IOException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/oauth2callback")
public class AuthCallBackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final Logger logger = Logger.getLogger(this.getClass().getName());

	public AuthCallBackServlet() {
		try {
			IgnoreSSLClient();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String callback(HttpServletRequest request, String code,
			String state) {
		String flowId = request.getSession().getAttribute("flowId").toString();
		OAuth2CodeGrantFlow flow = (OAuth2CodeGrantFlow) AuthServlet.map
				.get(flowId);

		final TokenResult tokenResult = flow.finish(code, state);
		return tokenResult.getAccessToken();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String error = request.getParameter("error");

		if (error == null) {

		 	OAuth2CodeSettings settings = (OAuth2CodeSettings) request.getSession().getAttribute("settings");
  			String accessToken = null;
		  
		  if("uaa".equals(settings.getResourceName())){
    	  JsonObject json  = getAccessToken(settings);
  		  accessToken = json.getString("access_token");
  		}
		  else{
	   		accessToken = callback(request, code, state);
		  }

      System.out.println("accessToken:" + accessToken);

			ServletOutputStream out = response.getOutputStream();

			try {

		 	logger.log(Level.INFO, settings.toString());

		  	request.getSession().setAttribute("accessToken", accessToken);


				JsonObject userInfo = getUserInfo(settings, accessToken);
				System.out.println("UserInfo:" + userInfo.toString());

				String userPictureURL = getUserPictureURL(settings, userInfo);
				System.out.println("UserPictureURL:" + userPictureURL);

        String sessionUserName = ""+request.getSession().getAttribute("username");

				// github nao possui chave name
				String userNameKey = "name";

				if ("github".equals(settings.getResourceName()))
					userNameKey = "login";
				else if("linkedin".equals(settings.getResourceName()))
  				userNameKey = "firstName";
  			else if("uaa".equals(settings.getResourceName() ) ){
  			  userNameKey = "username";
  			  sessionUserName = "uaa";
  			}

				// pegar usuario do google
				String name = userInfo.getString(userNameKey, sessionUserName).replaceAll("\"", "");
				String username = settings.getResourceName() + "/" + userInfo.getString("id", sessionUserName).replaceAll("\\s|\"", "");

				// guarda na sessao
				request.getSession().setAttribute("username", username);
				request.getSession().setAttribute("userpictureurl", userPictureURL);

				AuthenticationServlet.createUserIfNotExists(name, username, userPictureURL);

				// rediciona
				response.sendRedirect("/#/home");

			} catch (IOException exception) {
				logger.log(Level.SEVERE, exception.getMessage());
				exception.printStackTrace();
			}

			out.flush();
			out.close();

		} else {
			ServletOutputStream out = response.getOutputStream();
			out.println("Error: " + error);
			out.println(String.format("<hr/><a href='%s'>Login</a>", request.getSession().getAttribute("authHomeUri")));

		}

	}

	public static Client IgnoreSSLClient() throws Exception {
		SSLContext sslcontext = SSLContext.getInstance("TLS");
		sslcontext.init(null, new TrustManager[] { new X509TrustManager() {
			public void checkClientTrusted(X509Certificate[] arg0, String arg1)
					throws CertificateException {
			}

			public void checkServerTrusted(X509Certificate[] arg0, String arg1)
					throws CertificateException {
			}

			public X509Certificate[] getAcceptedIssuers() {
				return new X509Certificate[0];
			}

		} }, new java.security.SecureRandom());
		return ClientBuilder.newBuilder().sslContext(sslcontext)
				.hostnameVerifier((s1, s2) -> true).build();
	}

	public static JsonObject getUserInfo(OAuth2CodeSettings settings,
			String accessToken) throws ClientProtocolException, IOException {
		// get User Info
		HttpGet httpMethod = new HttpGet(settings.PROFILE_URI);
		httpMethod.setHeader("Authorization", "Bearer " + accessToken);
		httpMethod.setHeader("Accept", "application/json");

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpResponse httResponse = httpClient.execute(httpMethod);
		ResponseHandler<String> responseHandler = new BasicResponseHandler();
		String outputString = responseHandler.handleResponse(httResponse);

		// Convert JSON response
		JsonReader jsonReader = Json.createReader(new StringReader(outputString
				.trim()));
		return jsonReader.readObject();

	}

	public static JsonObject getAccessToken(OAuth2CodeSettings settings)
			throws ClientProtocolException, IOException {
		System.out.println("settings.TOKEN_URI:" + settings.TOKEN_URI);
		// get User Info
		HttpPost httpMethod = new HttpPost(settings.TOKEN_URI);
		// httpMethod.setHeader("Referer", settings.TOKEN_URI);
		// httpMethod.setHeader("Content-Type", "application/x-www-form-urlencoded");

		List<NameValuePair> parameters = new ArrayList<NameValuePair>();
		parameters.add(new BasicNameValuePair("grant_type",
				"client_credentials"));
		httpMethod.setEntity(new UrlEncodedFormEntity(parameters));

		System.out.println(settings.CLIENT_KEY + ":" + settings.CLIENT_SECRET);

		String encoding = Base64.getEncoder()
				.encodeToString(
						(settings.CLIENT_KEY + ":" + settings.CLIENT_SECRET)
								.getBytes());
		httpMethod.setHeader("Authorization", "Basic " + encoding);
		httpMethod.setHeader("Accept", "application/json");

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpResponse httResponse = httpClient.execute(httpMethod);
		int code = httResponse.getStatusLine().getStatusCode();
		System.out.println(code);
		if (code == 200) {
			ResponseHandler<String> responseHandler = new BasicResponseHandler();
			// 	return responseHandler.handleResponse(httResponse);
			String outputString = responseHandler.handleResponse(httResponse);
			System.out.println(outputString);

			JsonReader jsonReader = Json.createReader(new StringReader(
					outputString.trim()));
			return jsonReader.readObject();
		}
		return null;

	}

	public static String getUserPictureURL(OAuth2CodeSettings settings,
			JsonObject userInfo) throws ClientProtocolException, IOException {
		String urlPhoto = "img/nophoto.png";

		switch (settings.getResourceName()) {
		case "facebook":
			urlPhoto = String.format("http://graph.facebook.com/%s/picture",
					userInfo.getString("id"));
			break;
		case "google":
			urlPhoto = userInfo.getString("picture");
			break;
		case "github":
			urlPhoto = userInfo.getString("avatar_url");
			break;
		// case "linkedin":
		//   urlPhoto = userInfo.get("pictureUrl").getAsString();
		// break;
		}

		return urlPhoto;
	}

}
