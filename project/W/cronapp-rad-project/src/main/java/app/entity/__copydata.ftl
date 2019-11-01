<#if multitenant?? && multitenant?lower_case == "sim">
file=Company.java
file=Department.java
</#if>
file=User.java.ftl
file=UserRole.java
file=Role.java
<#if (enterprise)!false >
file=AuditLog.java
</#if>
<#if !(customMenu??) >
file=RolePK.java
</#if>