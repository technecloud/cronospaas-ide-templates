<#if multitenant?? && multitenant?lower_case == "sim">
file=CompanyDAO.java
file=DepartmentDAO.java
</#if>
file=RoleDAO.java
file=UserDAO.java
<#if (enterprise)!false >
file=AuditLogDAO.java
file=LoginDAO.java
file=RoleSecurableDAO.java
file=SecurableDAO.java
file=UserRoleDAO.java
file=UserSecurableDAO.java
</#if>