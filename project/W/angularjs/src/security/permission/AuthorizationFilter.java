package security.permission;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import security.dao.PermissionDAO;
import security.dao.RoleDAO;
import security.dao.SessionManager;
import security.dao.UserDAO;
import security.dao.UserRoleDAO;
import security.entity.Permission;
import security.entity.Role;
import security.entity.User;
import security.entity.UserRole;

@WebFilter(urlPatterns = { "/*" }, filterName = "authorization-filter")
public class AuthorizationFilter implements Filter {

	public static final long serialVersionUID = -1l;
	private final Logger logger = Logger.getLogger(this.getClass().getName());

	private List<Permission> permissions = new ArrayList<Permission>();

	public void init(FilterConfig config) throws ServletException {

		PermissionDAO dao = new PermissionDAO(SessionManager.getInstance().getEntityManager());

		try {
			synchronized (this) {
				permissions = dao.findAll();

				if (permissions.isEmpty()) {
					initialPermission();
					permissions = dao.findAll();
				}
			}

		} catch (Exception e) {
			new ServletException(e);
		}

	}

	private Permission buildPermission(Role role, String path, String verb, String exclude) {

		Permission permission = new Permission();
		permission.setRole(role);
		permission.setPath(path);
		permission.setVerb(verb);
		permission.setPriority(0);
		permission.setEnabled(true);
		permission.setExclude(exclude);

		return permission;

	}

	private void initialPermission() {
		System.out.println("creatingDefaultPermission");

		SessionManager session = SessionManager.getInstance();
		session.begin();

		EntityManager em = session.getEntityManager();

		UserDAO userDAO = new UserDAO(em);
		RoleDAO roleDAO = new RoleDAO(em);
		UserRoleDAO userRoleDAO = new UserRoleDAO(em);
		PermissionDAO permissionDAO = new PermissionDAO(em);

		User userAdmin = new User();
		userAdmin.setName("Administrator");
		userAdmin.setLogin("admin");
		userDAO.save(userAdmin);

		Role roleAdmin = new Role();
		roleAdmin.setId("00000000-0000-0000-0000-000000000000");
		roleAdmin.setName("Administrators");

		Role roleEveryOne = new Role();
		roleEveryOne.setId("11111111-1111-1111-1111-111111111111");
		roleEveryOne.setName("Every One");

		Role roleLogged = new Role();
		roleLogged.setId("22222222-2222-2222-2222-222222222222");
		roleLogged.setName("Logged");

		List<Role> roles = new ArrayList<>();
		roles.add(roleAdmin);
		roles.add(roleEveryOne);
		roles.add(roleLogged);

		for (Role role : roles)
			roleDAO.save(role);

		UserRole role = new UserRole();
		role.setUser(userAdmin);
		role.setRole(roleAdmin);

		userRoleDAO.save(role);

		permissionDAO.save(
				buildPermission(roleEveryOne, "(.)*", "ALL", "/api/rest/(.)*|/views/admin/(.)*|/views/logged/(.)*"));

		permissionDAO.save(
				buildPermission(roleLogged, "/views/logged/(.)*|/api/rest/(.)*", "ALL", "/api/rest/security/(.)*"));

		permissionDAO.save(buildPermission(roleAdmin, "/views/admin/(.)*|/api/rest/security/(.)*", "ALL", null));

		session.commit();

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		String username = httpRequest.getSession().getAttribute("username") == null ? "anonymous"
				: httpRequest.getSession().getAttribute("username").toString();
		String roles = httpRequest.getSession().getAttribute("roles") == null ? "11111111-1111-1111-1111-111111111111"
				: httpRequest.getSession().getAttribute("roles").toString();

		logger.log(Level.INFO, "session.username:" + username);
		logger.log(Level.INFO, "session.roles:" + roles);

		if (filter(httpRequest, httpResponse, username, roles)) {
			chain.doFilter(request, response);
		} else {
			httpResponse.setStatus(HttpServletResponse.SC_FORBIDDEN);
		}

	}

	private boolean filter(HttpServletRequest request, HttpServletResponse response, String username, String roles) {

		boolean allowed = false;

		String verb = request.getMethod();
		String uri = request.getRequestURI();
		String path = uri.substring(request.getContextPath().length());

		if (!username.equals("anonymous")) {
			roles += "22222222-2222-2222-2222-222222222222";
		}

		for (Permission permission : permissions) {

			System.out.println(permission.getRole().getId());

			logger.log(Level.INFO,
					"path:(" + path + ")=match(" + permission.getPath() + ")=" + path.matches(permission.getPath()));

			logger.log(Level.INFO, "path:(" + path + ")=match exception(" + permission.getExclude() + ")="
					+ path.matches("" + permission.getExclude()));

			if (permission.getEnabled() && roles.contains(permission.getRole().getId())) {
				if (verb.equalsIgnoreCase(permission.getVerb()) || permission.getVerb().equalsIgnoreCase("ALL")) {
					if ((path.matches(permission.getPath()) && !path.matches("" + permission.getExclude()))) {
						allowed = true;
						break;
					}
				}
			}

		}

		return allowed;
	}

	public void destroy() {
		/* Called before the Filter instance is removed 
		from service by the web container*/
	}

}