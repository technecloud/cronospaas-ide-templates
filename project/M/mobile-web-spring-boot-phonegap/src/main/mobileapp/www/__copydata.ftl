<#-- Verificar se existem parametros -->
<#if (authentication?? && backend?? && frontend??) >
	<#if (authentication?lower_case) != "nenhuma" &&(backend?lower_case) == "true" >
path.content=/www-autenticacao
	</#if>
	<#if ((authentication?lower_case) == "nenhuma")>
path.content=/www-sem-autenticacao
	</#if>
<#-- Caso contrario copiar tudo -->
<#else> 
path.content=/www-autenticacao
</#if>
