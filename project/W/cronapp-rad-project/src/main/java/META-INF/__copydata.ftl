<#if (frontend?lower_case) == "true" && (backend?lower_case) == "false" >
file=components.json
<#else>
file=app.config.ftl
file=components.json
file=persistence.xml.ftl
file=customQuery.json
</#if>