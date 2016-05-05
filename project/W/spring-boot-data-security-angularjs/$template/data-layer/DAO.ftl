package ${daoPackage};

import ${entityPackage}.*;
import java.util.List;
import org.springframework.stereotype.*;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.domain.*;
import org.springframework.data.repository.query.*;


@Repository("${clazz.name}DAO")
public interface ${clazz.name}DAO extends JpaRepository<${clazz.name}, String> {

<#list clazz.namedQueries as namedQuery><#assign keys = namedQuery.params?keys>	

<#assign method_named_query_name = "${namedQuery.name?uncap_first}">

  @Query("${namedQuery.query}")
  public <#if !namedQuery.void>List<${clazz.name}><#else>int</#if> ${method_named_query_name} (<#list keys as key>@Param(value="${key}") ${namedQuery.params[key]} ${key}<#if key_has_next>, </#if></#list> <#if !namedQuery.void><#if keys?size gt 0>, </#if>Pageable pageable </#if>);
  
</#list>


}