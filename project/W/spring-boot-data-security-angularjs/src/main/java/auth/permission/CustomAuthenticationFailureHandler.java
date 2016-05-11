package auth.permission;

import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.core.AuthenticationException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request,
            HttpServletResponse response, AuthenticationException exception)
            throws IOException, ServletException {
              
        response.setStatus(HttpServletResponse.SC_FORBIDDEN);
        super.onAuthenticationFailure(request, response, exception);

        // if (exception.getClass().isAssignableFrom(
        //         CustomUsernameNotFoundException.class)) {
        //     // TODO Set the redirect
        // }
    }

}
