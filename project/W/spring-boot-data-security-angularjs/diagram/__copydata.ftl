<#-- Verificar se existem parametros -->
<#if (authentication??) >
	<#if (authentication?lower_case) != "nenhuma">
file=app.umlcd
	</#if>
<#-- Caso contrario copiar tudo -->
<#else> 
file=app.umlcd
</#if>
