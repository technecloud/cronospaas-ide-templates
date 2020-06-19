<#if multitenant?? && (multitenant?lower_case == "sim" || multitenant?lower_case == "yes")>
file=CompanyREST.java
file=DepartmentREST.java
</#if>
file=UserREST.java
file=UserRoleREST.java
file=RoleREST.java