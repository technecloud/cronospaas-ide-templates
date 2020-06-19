<#-- Verificar se existem parametros -->
<#if (authentication??) >
	<#if (authentication?lower_case) != "nenhuma">
		<#if multitenant?? && (multitenant?lower_case == "sim" || multitenant?lower_case == "yes")>
path.content=/multitenant
		<#else>
file=app.umlcd
		</#if>
	</#if>
<#-- Caso contrario copiar tudo -->
<#else> 
	<#if multitenant?? && (multitenant?lower_case == "sim" || multitenant?lower_case == "yes")>
path.content=/multitenant
	<#else>
file=app.umlcd
	</#if>
</#if>
