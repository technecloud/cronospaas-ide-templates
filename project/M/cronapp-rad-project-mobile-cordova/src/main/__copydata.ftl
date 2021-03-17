<#-- Verificar se existem parametros -->
<#if (authentication?? && backend?? && frontend??) >
  <#if (authentication?lower_case) != "nenhuma" && (frontend?lower_case) == "true" && (backend?lower_case) == "true" >
path.content=/webapp-autenticacao
  </#if>
  <#if ((authentication?lower_case) == "nenhuma" && (frontend?lower_case) == "true") || ((backend?lower_case) == "false" && (frontend?lower_case) == "true")>
path.content=/webapp-sem-autenticacao
  </#if>
<#if (backend?lower_case) == "true">
path=/java
</#if>
<#-- Caso contrario copiar tudo -->
<#else> 
path=/java
	<#if (enterprise)!false >
path=/resources
	</#if>
</#if>
path=/mobileapp