<#-- Verificar se existem parametros -->
<#if (authentication??) >
    <#if (authentication?lower_case) != "nenhuma">
        <#if (enterprise)!false>
path.content=/enterprise
        <#else>
file=app.umlcd
        </#if>
    </#if>
<#-- Caso contrario copiar tudo -->
<#else>
    <#if (enterprise)!false>
path.content=/enterprise
    <#else>
file=app.umlcd
    </#if>
</#if>