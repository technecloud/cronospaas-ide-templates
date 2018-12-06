<#if ((backend?lower_case) == "true" && (frontend?lower_case) == "true") || (backend?lower_case) == "true" >
path=/config
path=/diagram
path=/src
path=/docs
file=.gitignore
file=pom.xml.ftl
file=project.png
file=README.md
file=spring-boot.png
</#if>
<#if (backend?lower_case) == "false" && (frontend?lower_case) == "true" >
path=/src
path=/docs
file=.gitignore
file=pom.xml.ftl
file=project.png
file=README.md
file=spring-boot.png
</#if>