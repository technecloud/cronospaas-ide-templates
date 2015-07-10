package api.rest.service.oauth2.authcode;

import java.io.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import org.glassfish.jersey.client.oauth2.ClientIdentifier;
import org.glassfish.jersey.client.oauth2.OAuth2ClientSupport;
import org.glassfish.jersey.client.oauth2.OAuth2CodeGrantFlow;
import org.glassfish.jersey.client.oauth2.OAuth2CodeGrantFlow.Builder;

@WebServlet("/oauth2")
public class AuthServlet extends HttpServlet implements Serializable{
	private static final long serialVersionUID = 1L;
	public static Map<String,Object> map = new HashMap<>();
	private OAuth2CodeSettings settings;
	
	private String authorize(HttpServletRequest request) {

		ClientIdentifier clientIdentifier = new ClientIdentifier(
				settings.CLIENT_KEY, settings.CLIENT_SECRET);

		Builder<?> builder = OAuth2ClientSupport
				.authorizationCodeGrantFlowBuilder(clientIdentifier,
						settings.AUTHORIZATION_URI, settings.TOKEN_URI);

		builder.redirectUri(settings.AUTHORIZATION_CALLBACK_URI);

		OAuth2CodeGrantFlow flow = builder.scope(settings.SCOPE)
				.redirectUri(settings.AUTHORIZATION_CALLBACK_URI).build();

		request.getSession().invalidate();
		//request.getSession().setAttribute("OAuth2CodeGrantFlow", flow);
		String flowId = UUID.randomUUID().toString();
		request.getSession().setAttribute("flowId", flowId);
		map.put(flowId, flow);
		request.getSession().setAttribute("settings", settings);

		String authHomeUri = request.getRequestURI();
		request.getSession().setAttribute("authHomeUri", authHomeUri);

		return flow.start();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//
		String idp = request.getParameter("idp") == null ? "wso2" : request
				.getParameter("idp");
		this.settings = new OAuth2CodeSettings(idp);

		String authorizationUri = authorize(request);
		response.setStatus(303);
		response.sendRedirect(authorizationUri);
	}
}
