<#if multitenant?? && (multitenant?lower_case == "sim" || multitenant?lower_case == "yes")>
file=CompanyDAO.java
file=DepartmentDAO.java
</#if>
file=UserDAO.java
file=UserRoleDAO.java
file=RoleDAO.java