package util;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.URL;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpResponse;
import org.apache.http.client.ResponseHandler;
import org.apache.http.impl.client.BasicResponseHandler;

public class OAuth2Configuration {

	static String KEY_STORE_FILENAME = "wso2carbon.jks";
	static String KEY_STORE_PASSWORD = "wso2carbon";
	
	public static void keyStoneOnWebResource() {
		URL trustStore = OAuth2Configuration.class.getResource("/" + KEY_STORE_FILENAME);
		System.out.println("keyStone" + trustStore);
		if (trustStore != null) {
			defineTrustableKeyStore(trustStore.getFile());
		}
	}

	public static void keyStone() {
		keyStoneOnWebResource();
	}

	public static void keyStoneOnFileSystem() {
		File trustStore = new File(System.getProperty("user.dir"),
				KEY_STORE_FILENAME);
		if (trustStore.exists())
			defineTrustableKeyStore(trustStore.getAbsolutePath());
	}

	public static void defineTrustableKeyStore(String trustStore) {
		/**
		 * Call to https://localhost:9443/services/ uses HTTPS protocol.
		 * Therefore we to validate the server certificate. The server
		 * certificate is looked up in the trust store. Following code sets what
		 * trust-store to look for and its JKs password. Note : The trust store
		 * should have server's certificate.
		 */
		System.setProperty("javax.net.ssl.trustStore", trustStore);
		System.setProperty("javax.net.ssl.trustStorePassword",
				KEY_STORE_PASSWORD);
	}

	public static String buildResponse(HttpResponse response,
			Integer... validStatusCodes) {
		String responseBody = null;
		int statusCode = response.getStatusLine().getStatusCode();
		if (Arrays.asList(validStatusCodes).contains(statusCode)) {
			ResponseHandler<String> responseHandler = new BasicResponseHandler();
			try {
				responseBody = responseHandler.handleResponse(response);
			} catch (IOException e) {
				responseBody = e.getMessage();
			}
		}
		return responseBody;
	}

	public static String exceptionToString(Throwable exception) {
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);
		exception.printStackTrace(pw);
		return sw.toString();
	}

	public static String extractLastPath(HttpServletRequest request) {
		String path = request.getRequestURI().substring(
				request.getContextPath().length());
		int lastIndex = path.lastIndexOf("/");
		String lastPath = lastIndex != -1 ? path.substring(lastIndex + 1)
				: null;
		return lastPath;
	}
}
