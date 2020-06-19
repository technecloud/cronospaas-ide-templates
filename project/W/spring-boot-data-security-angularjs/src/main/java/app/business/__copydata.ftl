<#if multitenant?? && (multitenant?lower_case == "sim" || multitenant?lower_case == "yes")>
file=CompanyBusiness.java
file=DepartmentBusiness.java
</#if>
file=UserBusiness.java
file=UserRoleBusiness.java
file=RoleBusiness.java