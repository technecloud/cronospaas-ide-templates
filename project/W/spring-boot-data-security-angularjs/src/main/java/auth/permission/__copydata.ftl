<#-- Verificar se existem parametros -->
<#if (authentication??) >
	<#if (authentication?lower_case) == "normal">
path.content=/normal
file=ChangePassword.java
file=ChangeTheme.java
file=SecurityPermission.java.ftl
	</#if>
	<#if (authentication?lower_case) == "token">
path.content=/token
file=ChangePassword.java
file=ChangeTheme.java
file=SecurityPermission.java.ftl
	</#if>
	<#if (authentication?lower_case) == "nenhuma">
path.content=/nenhuma
file=SecurityPermission.java.ftl
	</#if>
<#-- Caso contrario copiar tudo -->
<#else> 
path.content=/token
file=ChangePassword.java
file=ChangeTheme.java
file=SecurityPermission.java.ftl
</#if>
