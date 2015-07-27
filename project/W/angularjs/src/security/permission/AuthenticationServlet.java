package security.permission;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import security.dao.SessionManager;
import security.dao.UserDAO;
import security.dao.UserRoleDAO;
import security.entity.User;
import security.entity.UserRole;
import security.oauth2.authcode.OAuth2CodeSettings;
import security.oauth2.authcode.RevokeServlet;
import security.oauth2.flow.OAuth2Client;
import security.oauth2.flow.OAuth2Settings;
import security.rest.exceptions.CustomWebApplicationException;

@WebServlet(value = { "/auth", "/logout", "/session" }, name = "auth-servlet")
public class AuthenticationServlet extends HttpServlet {

	private static final long serialVersionUID = -1l;
	private Logger logger = Logger.getLogger(this.getClass().getName());

	UserDAO dao;

	public void init() throws ServletException {

		dao = new UserDAO(SessionManager.getInstance().getEntityManager());

	}

	public void destroy() {
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String username = req.getParameter("username");
			String password = req.getParameter("password");

			if (login(username, password)) {
				req.getSession().setAttribute("username", username);

				UserRoleDAO dao = new UserRoleDAO(SessionManager.getInstance().getEntityManager());

				List<UserRole> userRoles = dao.findByLogin(username, Integer.MAX_VALUE, 0);

				String rolesID = "11111111-1111-1111-1111-111111111111";
				for (UserRole userRole : userRoles) {
					rolesID += "," + userRole.getRole().getId();
				}

				req.getSession().setAttribute("roles", rolesID);

			} else {
				resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			}
		} catch (Exception e) {
			throw new CustomWebApplicationException(e);
		}
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String uri = req.getRequestURI();

			if ("/logout".equals(uri)) {
				logout(req, resp);
			} else if ("/session".equals(uri)) {
				session(req, resp);
			} else {
				resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			}
		} catch (Exception e) {
			throw new CustomWebApplicationException(e);
		}

	}

	private boolean login(String username, String password) {
		logger.log(Level.INFO, "login");
		//return authenticateLocal(username, password);
		//return authenticateDataBase(username, password);
		return authenticateOAuth2(username, password);
	}

	private boolean authenticateLocal(String username, String password) {
		return "techne".equals(username) && "techne".equals(password);
	}

	private boolean authenticateOAuth2(String username, String password) {
		OAuth2Client client = new OAuth2Client(OAuth2Settings.TOKEN_URI, OAuth2Settings.REVOKE_URI,
				OAuth2Settings.CLIENT_ID, OAuth2Settings.CLIENT_SECRET);
		String token = null;
		try {
			token = client.authenticate(username, password);
			createUserIfNotExists(username, username, null);
			logger.log(Level.INFO, token);
		} catch (Exception e) {
			e.printStackTrace();
			logger.log(Level.SEVERE, e.getMessage());
		}
		return (token != null);
	}

	public static void createUserIfNotExists(String name, String username, String pictureURL) {

		// cria usuario, senao existir
		SessionManager session = SessionManager.getInstance();
		UserDAO userDao = new UserDAO(session.getEntityManager());
		List<User> users = userDao.findByAttribute("login", username);
		if (users.isEmpty()) {
			session.begin();

			System.out.println("Creating user: " + username);
			User userEntity = new User();
			userEntity.setLogin(username);
			userEntity.setName(name);
			userEntity.setPicture(pictureURL);
			userDao.save(userEntity);

			session.commit();
		}

	}

	private boolean authenticateDataBase(String username, String password) {
		for (User user : dao.findAll()) {
			if (username.equals(user.getName()))
				return true;
		}
		return false;
	}

	private void logout(HttpServletRequest request, HttpServletResponse response) {
		logger.log(Level.INFO, "logout");

		Object accessToken = request.getSession().getAttribute("accessToken");
		request.getSession().invalidate();

		if (accessToken != null) {
			try {
				OAuth2CodeSettings settings = (OAuth2CodeSettings) request.getSession().getAttribute("settings");
				RevokeServlet.revoke(settings, accessToken.toString());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	private void session(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.log(Level.INFO, "session");

		Object username = req.getSession().getAttribute("username");
		Object userpictureurl = req.getSession().getAttribute("userpictureurl") == null ? "img/nophoto.png"
				: req.getSession().getAttribute("userpictureurl");
		String json = String.format("{\"username\": \"%s\", \"userpictureurl\": \"%s\"}", username, userpictureurl);

		if (username != null) {
			resp.setHeader("Content-Type", "application/json");
			resp.getOutputStream().print(json);
		} else {
			resp.setStatus(HttpServletResponse.SC_PROXY_AUTHENTICATION_REQUIRED);
		}

	}

}