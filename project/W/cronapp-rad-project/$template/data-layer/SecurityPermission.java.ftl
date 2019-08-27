package auth.permission;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.stereotype.Component;

import cronapp.framework.authentication.security.Permission;

@Component
public class SecurityPermission implements Permission {
  
  <#list listRole as role>
  ${role}

  </#list>
  @Override
  public void loadSecurityPermission(HttpSecurity http) throws Exception {

    // public
  	<#list listPermitAll as role>
  	${role}
  	</#list>
  
  	// role hasAuthority permission
  	<#list listHasAuthority as role>
  	${role}
  	</#list>

		// role hasAnyAuthority permission
		<#list listHasAnyAuthority as role>
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