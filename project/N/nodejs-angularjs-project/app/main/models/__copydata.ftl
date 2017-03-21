<#-- Verificar se existem parametros -->
<#if (authentication??)  && (authentication?lower_case) != "nenhuma" >
file=role.js
file=user.js
file=userrole.js
</#if>
file=index.js