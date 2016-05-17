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

<#list clazz.oneToManyRelation as relation>
  /**
   * OneToMany Relation
   * @generated
   */
  @Query("SELECT entity FROM ${relation.clazz.name} entity WHERE <#list clazz.primaryKeys as field>entity.${relation.relationField.pathName}.${field.name} = :${field.name}<#if field_has_next> AND </#if></#list>")
  public List<${relation.clazz.name}> find${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>@Param(value="${field.name}") ${field.type} ${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if> Pageable pageable );
</#list>



<#list clazz.manyToManyRelation as relation>
  /**
   * ManyToOne Relation
   * @generated
   */
  @Query("SELECT entity.${relation.relationClassField.name} FROM ${relation.associativeClassField.clazz.name} entity WHERE <#list clazz.primaryKeys as field>entity.${relation.associativeClassField.name}.${field.pathName} = :${field.name}<#if field_has_next> AND </#if></#list>")
  public List<${relation.relationClassField.type}> list${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>@Param(value="${field.name}") ${field.type} ${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if> Pageable pageable);

    /**
     * ManyToOne Relation Delete
     * @generated
     */
    @Modifying
    @Query("DELETE FROM ${relation.associativeClassField.clazz.name} entity WHERE <#list clazz.primaryKeys as field>entity.${relation.associativeClassField.name}.${field.pathName} = :instance${field.name?cap_first}<#if field_has_next> AND </#if></#list><#if clazz.primaryKeys?size gt 0> AND </#if><#list relation.relationClass.primaryKeys as field>entity.${relation.relationClassField.pathName}.${field.pathName} = :relation${field.name?cap_first}<#if field_has_next> AND </#if></#list>")
    public int delete${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>@Param(value="instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if><#list relation.relationClass.primaryKeys as field>@Param(value="relation${field.name?cap_first}") ${field.type} relation${field.name?cap_first}<#if field_has_next>, </#if></#list>);

</#list>



}