package com.techne.oauth2.client.view;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.techne.oauth2.client.dto.*;
import com.techne.oauth2.client.service.*;

public class AuthorizationCodeCallback extends HttpServlet {

	private static final long serialVersionUID = -8126162053720334139L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String authorizationCode = req.getParameter(OAuth2ClientService.CODE);
		String state = req.getParameter(OAuth2ClientService.STATE);
		
		OAuth2ClientService oAuth2ClientService = new OAuth2ClientService();
		OAuth2Context context = (OAuth2Context) req.getSession().getAttribute(Constants.OAUTH2_CONTEXT_PARAMETER);
		if(context==null){
			resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Auhorization Code request is required before");
			return;
		}
		
		AccessToken accessToken = oAuth2ClientService.getAccessToken(authorizationCode,context.getConfiguration());
		
		//set the OAuth2 Access Token on Session to be used on API calls
		context.setOauth2Token(accessToken);
		resp.sendRedirect(URLDecoder.decode(state,"UTF-8"));
	}
}
