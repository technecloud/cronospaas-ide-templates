<#-- Verificar se existem parametros -->
<#if (authentication??) >
	<#if (authentication?lower_case) != "nenhuma">
		<#if multitenant?lower_case == "sim">
path.content=/multitenant
		<#else>
file=app.umlcd
		</#if>
	</#if>
<#-- Caso contrario copiar tudo -->
<#else> 
	<#if multitenant?lower_case == "sim">
path.content=/multitenant
	<#else>
file=app.umlcd
	</#if>
</#if>
