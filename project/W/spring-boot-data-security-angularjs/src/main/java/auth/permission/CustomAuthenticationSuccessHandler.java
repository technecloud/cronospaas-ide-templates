package auth.permission;


import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest req,
                                        HttpServletResponse resp,
                                        Authentication authentication)
            throws IOException, ServletException {
        //do some logic here if you want something to be done whenever
        //the user successfully logs in.

        HttpSession session = req.getSession();
        User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        session.setAttribute("username", authUser.getUsername());
        session.setAttribute("authorities", authentication.getAuthorities());

        //req.getSession().setAttribute("username", username);

        //set our response to OK status
        resp.setStatus(HttpServletResponse.SC_OK);

        String roles = authUser.getAuthorities().toString().replaceFirst("\\[", "").replaceFirst("\\]", "");

        String str = String.format("{\"name\":\"%s\",\"id\":\"%s\",\"login\":\"%s\",\"roles\":\"%s\",\"root\":%s}"
        , authUser.getUsername()
        , -1
        , authUser.getUsername()
        , roles
        , roles.contains(AuthenticationConfigurer.ROLE_ADMIN_NAME) );
        resp.getOutputStream().print(str);
        resp.setHeader("Content-Type", "application/json");

        //since we have created our custom success handler, its up to us to where
        //we will redirect the user after successfully login
//        httpServletResponse.sendRedirect("home");
        //{"name":"Administrator","id":"6C2B5EB7-AFE7-4A04-9CE2-F6B2E8BB7503","login":"admin","roles":"11111111-1111-1111-1111-111111111111,00000000-0000-0000-0000-000000000000","root":true}
        
    }
}