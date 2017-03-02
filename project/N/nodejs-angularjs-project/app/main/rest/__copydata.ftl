<#-- Verificar se existem parametros -->
<#if (authentication??)  && (authentication?lower_case) != "nenhuma" >
file=auth.js
file=role.js
file=user.js
file=userrole.js
</#if>
