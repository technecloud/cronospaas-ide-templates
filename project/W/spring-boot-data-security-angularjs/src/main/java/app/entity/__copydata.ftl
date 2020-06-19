<#if multitenant?? && (multitenant?lower_case == "sim" || multitenant?lower_case == "yes")>
file=Company.java
file=Department.java
</#if>
file=User.java.ftl
file=UserRole.java
file=Role.java