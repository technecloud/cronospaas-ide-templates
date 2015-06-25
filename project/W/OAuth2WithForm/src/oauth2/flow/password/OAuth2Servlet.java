package oauth2.flow.password;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.OAuth2Configuration;
import util.WSO2Settings;
import controller.OAuth2Client;
import controller.WSO2AdminManagerClient;

@WebServlet("/oauth2/*")
public class OAuth2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OAuth2Client client;
	private WSO2AdminManagerClient clientAdmin;

	@Override
	public void init() throws ServletException {
		client = new OAuth2Client(WSO2Settings.TOKEN_URI,
				WSO2Settings.REVOKE_URI, WSO2Settings.CLIENT_ID,
				WSO2Settings.CLIENT_SECRET);
		clientAdmin = new WSO2AdminManagerClient(WSO2Settings.SERVER_URL,
				WSO2Settings.SERVER_PORT, WSO2Settings.ADMIN_USERNAME,
				WSO2Settings.ADMIN_PASSWORD);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String lastPath = OAuth2Configuration.extractLastPath(request);

		switch (lastPath) {
		case "auth":
			authenticate(request, response);
			break;
		case "register":
			register(request, response);
			break;
		}

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String lastPath = OAuth2Configuration.extractLastPath(request);
		switch (lastPath) {
		case "logout":
			logout(request, response);
			break;
		}

	}

	private void logout(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		Object token = getSessionAttribute(request, SessionAttributes.TOKEN);
		if (token != null)
			client.logout(token.toString());

		for (SessionAttributes attribute : SessionAttributes.values())
			request.getSession().setAttribute(attribute.name(), null);

		debug(request, response, null);
	}

	private void register(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");

		String json = null;
		try {
			json = clientAdmin.createUser(username, password, email);
			if (json != null)
				response.setStatus(HttpServletResponse.SC_CREATED);
			else
				response.setStatus(HttpServletResponse.SC_EXPECTATION_FAILED);

		} catch ( IOException e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getOutputStream().print(OAuth2Configuration.exceptionToString(e));
		}

		debug(request, response, json);

	}

	private void authenticate(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		String token = null;
		try {

			String username = request.getParameter("username");
			String password = request.getParameter("password");

			token = client.authenticate(username, password);
			if (token != null) {

				request.getSession().setAttribute(
						SessionAttributes.TOKEN.name(), token);
				request.getSession().setAttribute(
						SessionAttributes.USERNAME.name(), username);

				boolean isAdminUser = clientAdmin.isAdminUser(username);
				request.getSession().setAttribute(
						SessionAttributes.IS_ADMIN.name(), isAdminUser);
				String roleNamesOfUser = clientAdmin.getRolesOfUser(username);

				request.getSession().setAttribute(
						SessionAttributes.IS_ADMIN.name(), isAdminUser);

				request.getSession().setAttribute(
						SessionAttributes.ROLE_NAMES.name(), roleNamesOfUser);
				response.setStatus(HttpServletResponse.SC_ACCEPTED);

			} else {
				response.setStatus(HttpServletResponse.SC_FORBIDDEN);
			}

		} catch (Exception e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getOutputStream().print(OAuth2Configuration.exceptionToString(e));
		}

		debug(request, response, token);

	}

	private void debug(HttpServletRequest request,
			HttpServletResponse response, String message) throws IOException {
		ServletOutputStream out = response.getOutputStream();
		try {
			out.print("<pre>");

			if (message != null)
				out.println(message);

			for (SessionAttributes attribute : SessionAttributes.values()) {
				out.println(attribute.name() + " : "
						+ getSessionAttribute(request, attribute));
			}
			out.println("StatusCode : " + response.getStatus());
			out.print("</pre>");

		} catch (Exception e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			out.print(OAuth2Configuration.exceptionToString(e));
		}
	}

	public static Object getSessionAttribute(HttpServletRequest request,
			SessionAttributes attribute) {
		return request.getSession().getAttribute(attribute.name());
	}

	public enum SessionAttributes {
		TOKEN, USERNAME, IS_ADMIN, ROLE_NAMES;
	}
}
