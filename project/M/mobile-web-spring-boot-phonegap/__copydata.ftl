<#-- Verificar se existem parametros -->
<#if (backend?? && frontend?? && authentication?? ) >
	<#if (backend?lower_case) == "true" && (authentication?lower_case) != "nenhuma"  >
path=/config
path=/diagram
file=pom.xml
file=project.png
	</#if>
	<#if (backend?lower_case) == "true" && (authentication?lower_case) == "nenhuma"  >
file=pom.xml
file=project.png
	</#if>
<#-- Caso contrario copiar tudo -->
<#else> 
path=/config
path=/diagram
file=pom.xml
file=project.png
</#if>
path=/src
file=README.md