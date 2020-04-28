<#-- Verificar se existem parametros -->
<#if (authentication??) >
  <#if (authentication?lower_case) == "normal">
path.content=/normal
file=ChangePassword.java
file=ChangeTheme.java

  </#if>
  <#if (authentication?lower_case) == "token">
path.content=/token
file=ChangePassword.java
file=ChangeTheme.java

  </#if>
  <#if (authentication?lower_case) == "nenhuma">
path.content=/nenhuma

  </#if>
<#-- Caso contrario copiar tudo -->
<#else> 
path.content=/token
file=ChangePassword.java
file=ChangeTheme.java

</#if>
file=MultitenantJpaTransactionManager.java
file=TenantComponent.java
file=TenantEntityManagerFactory.java