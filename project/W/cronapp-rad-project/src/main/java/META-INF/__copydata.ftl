<#if (frontend?lower_case) == "true" && (backend?lower_case) == "false" >
file=components.json
<#else>
file=components.json
file=persistence.xml.ftl
file=customQuery.json.ftl
</#if>