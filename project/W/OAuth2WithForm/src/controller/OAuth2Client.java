package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;

import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import util.OAuth2Configuration;

public class OAuth2Client {
	private String grantType = "password";
	private String clientId;
	private String clientSecret;
	private String tokenUri;
	private String revokeUri;

	public OAuth2Client(String tokenUri, String revokeUri, String clientId,
			String clientSecret) {
		this.tokenUri = tokenUri;
		this.revokeUri = revokeUri;
		this.clientId = clientId;
		this.clientSecret = clientSecret;

		OAuth2Configuration.keyStone();
	}

	public String authenticate(String username, String password)
			throws ClientProtocolException, IOException {

		HttpPost httpMethod = new HttpPost(tokenUri);
		ArrayList<NameValuePair> parameters = new ArrayList<NameValuePair>();
		parameters.add(new BasicNameValuePair("grant_type", grantType));
		parameters.add(new BasicNameValuePair("username", username));
		parameters.add(new BasicNameValuePair("password", password));

		httpMethod.setEntity(new UrlEncodedFormEntity(parameters));

		String encoding = Base64.getEncoder().encodeToString(
				(clientId + ":" + clientSecret).getBytes());
		httpMethod.setHeader("Authorization", "Basic " + encoding);

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpResponse response = httpClient.execute(httpMethod);

		return OAuth2Configuration.buildResponse(response, HttpServletResponse.SC_OK);
	}

	public String logout(String accessToken) throws ClientProtocolException,
			IOException {

		HttpPost httpMethod = new HttpPost(revokeUri);

		String encoding = Base64.getEncoder().encodeToString(
				(clientId + ":" + clientSecret).getBytes());
		httpMethod.setHeader("Authorization", "Bearer " + encoding);

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpResponse response = httpClient.execute(httpMethod);

		return OAuth2Configuration.buildResponse(response,
				HttpServletResponse.SC_MOVED_TEMPORARILY);
	}
	


}
