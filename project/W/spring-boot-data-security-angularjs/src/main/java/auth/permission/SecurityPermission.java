package auth.permission;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.stereotype.Component;

/**
 * Classe que configura as permissões de acesso
 * 
 * @author Techne
 *
 */
@Component
public class SecurityPermission {
  
  public static final String ROLE_ADMIN_NAME = "Administrators";
  public static final String ROLE_LOGGED_NAME = "Logged";
  
  public void loadSecurityPermission(HttpSecurity http) throws Exception {
    
    // public
    http.authorizeRequests().antMatchers("/index.html").permitAll();
    http.authorizeRequests().antMatchers("/favicon.ico").permitAll();
    http.authorizeRequests().antMatchers("/public/**").permitAll();
    http.authorizeRequests().antMatchers("/plugins/**").permitAll();
    http.authorizeRequests().antMatchers("/components/**").permitAll();
    http.authorizeRequests().antMatchers("/js/**").permitAll();
    http.authorizeRequests().antMatchers("/css/**").permitAll();
    http.authorizeRequests().antMatchers("/img/**").permitAll();
    http.authorizeRequests().antMatchers("/i18n/**").permitAll();
    http.authorizeRequests().antMatchers("/views/login.view.html").permitAll();
    http.authorizeRequests().antMatchers("/views/error/**").permitAll();
    
    // role admin permission
    http.authorizeRequests().antMatchers("/views/admin/**").hasAuthority(ROLE_ADMIN_NAME);
    http.authorizeRequests().antMatchers("/api/security/rest/**").hasAuthority(ROLE_ADMIN_NAME);
    
    // role logged permission
    http.authorizeRequests().antMatchers("/views/logged/**").hasAuthority(ROLE_LOGGED_NAME);
    http.authorizeRequests().antMatchers("/api/rest/**").hasAuthority(ROLE_LOGGED_NAME);
    http.authorizeRequests().antMatchers("POST", "/changePassword").hasAuthority(ROLE_LOGGED_NAME);
    http.authorizeRequests().antMatchers("POST", "/changeTheme").hasAuthority(ROLE_LOGGED_NAME);
    
    // deny all
    http.authorizeRequests().antMatchers("/**").denyAll();
    
  }
  
}
