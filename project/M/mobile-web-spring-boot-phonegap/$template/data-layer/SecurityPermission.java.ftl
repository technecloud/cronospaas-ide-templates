package auth.permission;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.stereotype.Component;

/**
 * Classe que configura as permissões de acesso
 * 
 * @author Generated SecurityPermission
 *
 */
@Component
public class SecurityPermission {

  //static
	<#list listRole as role>
	${role}
	</#list>
	
  public void loadSecurityPermission(HttpSecurity http) throws Exception {
    
	// public
	<#list listPermitAll as role>
    ${role}
	</#list>
    
	// role hasAuthority permission
	<#list listHasAuthority as role>
    ${role}
	</#list>
	
    // autenticated
  	<#list listAutenticated as role>
    ${role}
  	</#list>
    
	// deny all
	<#list listDenyAll as role>
    ${role}
	</#list>
    
  }
}