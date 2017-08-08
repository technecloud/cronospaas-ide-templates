<#-- Verificar se existem parametros -->
<#if (backend?? && frontend??)>
<#if ((backend?lower_case) == "true" && (frontend?lower_case) == "true") || (backend?lower_case) == "true">
path=/app
path=/i18n
path=/META-INF
file=SpringBootMain.java.ftl
</#if>
<#if (backend?lower_case) == "false" && (frontend?lower_case) == "true">
path=/META-INF
</#if>
<#-- Caso contrario copiar tudo -->
<#else>
path=/app
path=/i18n
path=/META-INF
file=SpringBootMain.java.ftl
</#if>
<#if (authentication??)>
path=/auth/permission
</#if>