package ${daoPackage};

import ${entityPackage}.*;
import java.util.List;
import org.springframework.stereotype.*;
import org.springframework.data.jpa.repository.*;

@Repository("${clazz.name}DAO")
public interface ${clazz.name}DAO extends JpaRepository<${clazz.name}, String> {

<#list clazz.namedQueries as namedQuery><#assign keys = namedQuery.params?keys>	

<#assign method_named_query_name = "${clazz.name?uncap_first}${namedQuery.name?cap_first}">

  @Query("${namedQuery.query}")
  public <#if !namedQuery.void>List<${clazz.name}><#else>int</#if> ${method_named_query_name} (<#list keys as key>${namedQuery.params[key]} ${key}<#if key_has_next>, </#if></#list>);
  
</#list>


}

