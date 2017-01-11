package oauth2.flow.password;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/User")
public class UserService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.getOutputStream().print("GET");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.getOutputStream().print("POST");
	}

	protected void doPut(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.getOutputStream().print("PUT");
	}

	protected void doDelete(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.getOutputStream().print("DELETE");
	}

}
