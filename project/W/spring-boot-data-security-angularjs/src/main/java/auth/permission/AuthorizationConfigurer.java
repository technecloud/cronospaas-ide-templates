package auth.permission;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import security.dao.PermissionDAO;
import security.entity.Permission;

@Configuration
@EnableWebSecurity
public class AuthorizationConfigurer extends WebSecurityConfigurerAdapter {

	@Autowired
	private PermissionDAO permissionRepository;

	@Autowired
	private AuthenticationConfigurer authenticationProvider;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authenticationProvider);
		
		if(permissionRepository.count() == 0)
		authenticationProvider.createDatabase();
	}

	private HttpMethod method(String verb) {
		// null for any method
		return "ALL".equals(verb) ? null : HttpMethod.valueOf(verb);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		// post sem csrf
		http.csrf().disable();

		// public 
		String [] publics = {"/index.html", "/views/login.view.html", "/public/**", "/plugins/**", "/components/**", "/js/**", "/css/**", "/img/**", "/i18n/**"};
		http.authorizeRequests()
        .antMatchers(publics).permitAll()
        .anyRequest().authenticated();
		
		
		// List<Permission> permissions = permissionRepository.findAll();
		// for (Permission p : permissions) {
		// 	http.authorizeRequests().antMatchers(method(p.getVerb()), p.getPath()).hasAuthority(p.getRole().getName())
		// 			.anyRequest().authenticated();
		// }
		
		http.authorizeRequests().anyRequest().anonymous();
		
//		http.authorizeRequests().antMatchers("/#home").hasAuthority("Logged").anyRequest().authenticated();

		// login/logout
		http.formLogin().loginProcessingUrl("/auth").and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
				.logoutSuccessUrl("/login");
		
	}
}
