package auth.permission.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import auth.permission.SecurityPermission;

/**
 * Classe que configura o WebSecurity, possibilitando requerer que o
 * usuário esteja logado para acessar qualquer usuário
 * 
 * @author Techne
 *
 */
@Configuration
@EnableWebSecurity
public class AuthorizationConfigurer extends WebSecurityConfigurerAdapter {

	@Autowired
	private SecurityPermission securityPermission;

	/**
	 * Configurações default para WebSecurity
	 */
	@Override
	protected void configure(HttpSecurity http) throws Exception {

		// post sem csrf
		http.csrf().disable();

		// load Security Permission
		securityPermission.loadSecurityPermission(http);

		// x-frame-options disable        
		http.headers().frameOptions().disable().httpStrictTransportSecurity().disable();

	}


}
