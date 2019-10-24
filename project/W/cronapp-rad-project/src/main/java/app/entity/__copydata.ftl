<#if multitenant?? && multitenant?lower_case == "sim">
file=Company.java
file=Department.java
</#if>
file=User.java.ftl
file=UserRole.java
file=Role.java
file=AuditLog.java
<#if !(customMenu??) >
file=RolePK.java
</#if>