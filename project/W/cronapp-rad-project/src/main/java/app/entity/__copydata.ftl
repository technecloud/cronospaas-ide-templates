<#if multitenant?? && multitenant?lower_case == "sim">
file=Company.java
file=Department.java
</#if>
file=User.java.ftl
file=UserRole.java
file=Role.java
<#if (enterprise)!false >
file=AuditLog.java
file=Login.java
file=RoleSecurable.java
file=Securable.java
file=UserSecurable.java
</#if>