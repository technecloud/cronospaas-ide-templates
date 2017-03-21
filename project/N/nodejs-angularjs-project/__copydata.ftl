<#-- Verificar se existem parametros -->
<#if (backend??)  && (backend?lower_case) == "true" >
path=/app
path=/diagram
</#if>
<#if (frontend??) && (frontend?lower_case) == "true" >
path=/public
</#if>
path=/.db
path=/config
path=/node_modules
file=package.json
file=server.js.ftl