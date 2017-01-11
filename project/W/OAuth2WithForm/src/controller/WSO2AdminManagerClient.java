package controller;

import java.io.IOException;
import java.util.Base64;

import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;

import com.google.gson.*;

import util.OAuth2Configuration;

public class WSO2AdminManagerClient {

	private String serverUrl;
	private int port;
	private String adminPassword;
	private String adminUserName;

	private String URL_USERS;
	private String URL_ROLES;
	private String URL_SOAP_REMOTE_USER_STORE_MANAGER;
	private String URL_USERS_BY_ID;
	private String URL_ROLES_BY_ID;

	public WSO2AdminManagerClient(String serverUrl, int port,
			String adminUserName, String adminPassword) {
		this.serverUrl = serverUrl;
		this.port = port;
		this.adminUserName = adminUserName;
		this.adminPassword = adminPassword;

		URL_USERS = serverUrl + ":" + port + "/wso2/scim/Users";
		URL_ROLES = serverUrl + ":" + port + "/wso2/scim/Groups";
		URL_USERS_BY_ID = URL_USERS + "/%s";
		URL_ROLES_BY_ID = URL_ROLES + "/%s";
		URL_SOAP_REMOTE_USER_STORE_MANAGER = serverUrl
				+ ":"
				+ port
				+ "/services/RemoteUserStoreManagerService.RemoteUserStoreManagerServiceHttpsSoap11Endpoint/";

		OAuth2Configuration.keyStone();
	}

	public String createUser(String userName, String userPassword, String email)
			throws ClientProtocolException, IOException {
		HttpPost httpMethod = new HttpPost(URL_USERS);
		appendHeaderBasicAuthentication(httpMethod);

		String json = String
				.format("{'userName': '%s', 'password': '%s', 'emails': '%s', 'name': {'givenName': '%s', 'familyName': '%s'},  'schemas': '[]'}",
						userName, userPassword, email, userName, userName);

		StringEntity entity = new StringEntity(json);
		entity.setContentType("application/json");

		httpMethod.setEntity(entity);

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpResponse response = httpClient.execute(httpMethod);

		return OAuth2Configuration.buildResponse(response, HttpServletResponse.SC_CREATED);
	}

	public String createRole(String roleName) throws 
			ClientProtocolException, IOException {
		HttpPost httpMethod = new HttpPost(URL_ROLES);
		appendHeaderBasicAuthentication(httpMethod);

		String json = String.format("{'displayName': '%s'}", roleName);

		StringEntity entity = new StringEntity(json);
		entity.setContentType("application/json");
		httpMethod.setEntity(entity);

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpResponse response = httpClient.execute(httpMethod);

		return OAuth2Configuration.buildResponse(response, HttpServletResponse.SC_CREATED);
	}

	public String removeUsersToRole(String roleName, String... userNames)
			throws ClientProtocolException, IOException {
		HttpPost httpMethod = new HttpPost(URL_SOAP_REMOTE_USER_STORE_MANAGER);
		appendHeaderBasicAuthentication(httpMethod);

		StringBuilder body = new StringBuilder();
		body.append("<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:ser=\"http://service.ws.um.carbon.wso2.org\"><soapenv:Header/><soapenv:Body><ser:updateUserListOfRole>");
		body.append("<ser:roleName>" + roleName + "</ser:roleName>");

		for (String userName : userNames)
			body.append("<ser:deletedUsers>" + userName + "</ser:deletedUsers>");

		body.append("</ser:updateUserListOfRole></soapenv:Body></soapenv:Envelope>");

		StringEntity entity = new StringEntity(body.toString());
		entity.setContentType("text/soap+xml");
		entity.setContentEncoding("utf-8");

		httpMethod.setHeader("SOAPAction", "urn:updateUserListOfRole");
		httpMethod.setHeader("Accept", "application/json");
		httpMethod.addHeader("Content-Type", "text/xml; charset=utf-8");

		httpMethod.setEntity(entity);

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpResponse response = httpClient.execute(httpMethod);

		return OAuth2Configuration
				.buildResponse(response, HttpServletResponse.SC_ACCEPTED);
	}

	public boolean userContainsRole(String userName, String roleName)
			throws ClientProtocolException, IOException {
		String rolesOfUser = getRolesOfUser(userName);
		return rolesOfUser.contains(roleName);
	}

	public boolean isExistingUser(String userName)
			throws ClientProtocolException, IOException {
		return getUserByName(userName) != null;
	}

	public boolean isExistingRole(String roleName) {
		boolean found = false;
		try {
			found = getRoleByName(roleName) != null;
		} catch (Exception e) {
			found = false;
		}
		return found;
	}

	public String getRolesOfUser(String userName)
			throws ClientProtocolException, IOException {
		HttpPost httpMethod = new HttpPost(URL_SOAP_REMOTE_USER_STORE_MANAGER);
		appendHeaderBasicAuthentication(httpMethod);

		StringBuilder body = new StringBuilder();
		body.append("<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:ser=\"http://service.ws.um.carbon.wso2.org\"><soapenv:Header/>");
		body.append("<soapenv:Body><ser:getRoleListOfUser><ser:userName>"
				+ userName + "</ser:userName></ser:getRoleListOfUser>");
		body.append("</soapenv:Body></soapenv:Envelope>");

		StringEntity entity = new StringEntity(body.toString());
		entity.setContentType("text/soap+xml");
		entity.setContentEncoding("utf-8");

		httpMethod.setHeader("SOAPAction", "urn:getRoleListOfUser");
		httpMethod.setHeader("Accept", "application/json");
		httpMethod.addHeader("Content-Type", "text/xml; charset=utf-8");

		httpMethod.setEntity(entity);

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpResponse response = httpClient.execute(httpMethod);
		ResponseHandler<String> responseHandler = new BasicResponseHandler();
		String responseBody = responseHandler.handleResponse(response);

		JsonObject json = (JsonObject) new JsonParser().parse(responseBody);
		JsonArray roles = json.getAsJsonObject("getRoleListOfUserResponse")
				.getAsJsonArray("return");

		return roles.toString();
	}

	public String addUsersToRole(String roleName, String... userNames)
			throws ClientProtocolException, IOException {

		HttpPost httpMethod = new HttpPost(URL_SOAP_REMOTE_USER_STORE_MANAGER);
		appendHeaderBasicAuthentication(httpMethod);

		StringBuilder body = new StringBuilder();
		body.append("<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:ser=\"http://service.ws.um.carbon.wso2.org\"><soapenv:Header/><soapenv:Body><ser:updateUserListOfRole>");
		body.append("<ser:roleName>" + roleName + "</ser:roleName>");

		for (String userName : userNames)
			body.append("<ser:newUsers>" + userName + "</ser:newUsers>");

		body.append("</ser:updateUserListOfRole></soapenv:Body></soapenv:Envelope>");

		StringEntity entity = new StringEntity(body.toString());
		entity.setContentType("text/soap+xml");
		entity.setContentEncoding("utf-8");

		httpMethod.setHeader("SOAPAction", "urn:updateUserListOfRole");
		httpMethod.setHeader("Accept", "application/json");
		httpMethod.addHeader("Content-Type", "text/xml; charset=utf-8");

		httpMethod.setEntity(entity);

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpResponse response = httpClient.execute(httpMethod);

		return OAuth2Configuration
				.buildResponse(response, HttpServletResponse.SC_ACCEPTED);
	}

	public String listUsers() throws ClientProtocolException, IOException {

		HttpGet httpMethod = new HttpGet(URL_USERS);
		appendHeaderBasicAuthentication(httpMethod);

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpResponse response = httpClient.execute(httpMethod);

		return OAuth2Configuration.buildResponse(response, HttpServletResponse.SC_OK);

	}

	public String listRoles() throws ClientProtocolException, IOException {
		// curl -k -v --user admin:admin \
		// -X GET https://localhost:9443/wso2/scim/Groups

		HttpGet httpMethod = new HttpGet(URL_ROLES);
		appendHeaderBasicAuthentication(httpMethod);

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpResponse response = httpClient.execute(httpMethod);

		return OAuth2Configuration.buildResponse(response, HttpServletResponse.SC_OK);

	}

	public String getUserById(String userId) throws ClientProtocolException,
			IOException {

		String url = String.format(URL_USERS_BY_ID, userId);
		HttpGet httpMethod = new HttpGet(url);
		appendHeaderBasicAuthentication(httpMethod);

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpResponse response = httpClient.execute(httpMethod);

		return OAuth2Configuration.buildResponse(response, HttpServletResponse.SC_OK);

	}

	public String getUserByName(String userName)
			throws ClientProtocolException, IOException {
		return getUserByAttribute("userName", userName);
	}

	public String getUserByAttribute(String attributeName, String attributeValue)
			throws ClientProtocolException, IOException {

		String url = serverUrl + ":" + port + "/wso2/scim/Users?filter="
				+ attributeName + "Eq" + attributeValue;
		HttpGet httpMethod = new HttpGet(url);
		appendHeaderBasicAuthentication(httpMethod);

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpResponse response = httpClient.execute(httpMethod);

		return OAuth2Configuration.buildResponse(response, HttpServletResponse.SC_OK);

	}

	public String getRoleByName(String roleName)
			throws ClientProtocolException, IOException {
		return getRoleByName("PRINCIPAL", roleName);
	}

	public String getRoleByName(String roleDomain, String roleName)
			throws ClientProtocolException, IOException {
		return getRoleByAttribute("displayName", roleDomain + "/" + roleName);
	}

	public String getRoleByAttribute(String attributeName, String attributeValue)
			throws ClientProtocolException, IOException {

		String url = serverUrl + ":" + port + "/wso2/scim/Groups?filter="
				+ attributeName + "Eq" + attributeValue;
		HttpGet httpMethod = new HttpGet(url);
		appendHeaderBasicAuthentication(httpMethod);

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpResponse response = httpClient.execute(httpMethod);

		return OAuth2Configuration.buildResponse(response, HttpServletResponse.SC_OK);

	}

	public boolean isAdminUser(String userName) throws ClientProtocolException,
			IOException {
		String roles = getRolesOfUser(userName);
		return roles.contains("admin");
	}

	public String deleteUserById(String userId) throws ClientProtocolException,
			IOException {

		String url = String.format(URL_USERS_BY_ID, userId);
		HttpDelete httpMethod = new HttpDelete(url);
		appendHeaderBasicAuthentication(httpMethod);

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpResponse response = httpClient.execute(httpMethod);

		return OAuth2Configuration.buildResponse(response, HttpServletResponse.SC_OK);
	}

	public String deleteUserByName(String userName)
			throws ClientProtocolException, IOException {
		HttpPost httpMethod = new HttpPost(URL_SOAP_REMOTE_USER_STORE_MANAGER);
		appendHeaderBasicAuthentication(httpMethod);

		StringBuilder body = new StringBuilder();
		body.append("<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:ser=\"http://service.ws.um.carbon.wso2.org\"><soapenv:Header/><soapenv:Body>");
		body.append("<ser:deleteUser><ser:userName>" + userName
				+ "</ser:userName>");
		body.append("</ser:deleteUser></soapenv:Body></soapenv:Envelope>");

		StringEntity entity = new StringEntity(body.toString());
		entity.setContentType("text/soap+xml");
		entity.setContentEncoding("utf-8");

		httpMethod.setHeader("SOAPAction", "urn:deleteUser");
		httpMethod.setHeader("Accept", "application/json");
		httpMethod.addHeader("Content-Type", "text/xml; charset=utf-8");

		httpMethod.setEntity(entity);

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpResponse response = httpClient.execute(httpMethod);

		return OAuth2Configuration
				.buildResponse(response, HttpServletResponse.SC_ACCEPTED);

	}

	private void appendHeaderBasicAuthentication(HttpRequestBase httpMethod) {
		String encoding = Base64.getEncoder().encodeToString(
				(adminUserName + ":" + adminPassword).getBytes());
		httpMethod.setHeader("Authorization", "Basic " + encoding);
	}

	public String deleteRole(String roleId) throws ClientProtocolException,
			IOException {
		String url = String.format(URL_ROLES_BY_ID, roleId);
		HttpDelete httpMethod = new HttpDelete(url);
		appendHeaderBasicAuthentication(httpMethod);

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpResponse response = httpClient.execute(httpMethod);

		return OAuth2Configuration.buildResponse(response, HttpServletResponse.SC_OK);
	}

	public String updateUserPassword(String userId, String userName,
			String userPassword) throws ClientProtocolException, IOException {

		String url = String.format(URL_USERS_BY_ID, userId);
		HttpPut httpMethod = new HttpPut(url);
		appendHeaderBasicAuthentication(httpMethod);

		String json = String.format("{ 'userName': '%s', 'password': '%s' }",
				userName, userPassword);
		StringEntity entity = new StringEntity(json);
		entity.setContentType("application/json");

		httpMethod.setEntity(entity);

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpResponse response = httpClient.execute(httpMethod);

		return OAuth2Configuration.buildResponse(response, HttpServletResponse.SC_OK);

	}

	public String deleteRoleByName(String roleName)
			throws ClientProtocolException, IOException {
		return deleteRoleByName("PRINCIPAL", roleName);
	}

	public String deleteRoleByName(String roleDomain, String roleName)
			throws ClientProtocolException, IOException {
		String json = getRoleByName(roleDomain, roleName);
//		JSONObject role = new JSONObject(json);
		JsonObject role = new JsonParser().parse(json).getAsJsonObject();
		return deleteRole(role.getAsJsonObject("id").getAsString());
	}

}
