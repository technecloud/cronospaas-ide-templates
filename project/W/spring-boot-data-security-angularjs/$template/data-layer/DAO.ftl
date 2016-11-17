package ${daoPackage}<#if subPackage??>.${subPackage}</#if>;

import ${entityPackage}.*;
<#if subPackage??>
import ${entityPackage}.${subPackage}.*;
</#if>
<#list clazz.subPackageToImport as subPackageToImport>
<#if subPackage?? && subPackageToImport != subPackage >
import ${entityPackage}.${subPackageToImport}.*;
</#if>
</#list>
import java.util.*;
import org.springframework.stereotype.*;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.domain.*;
import org.springframework.data.repository.query.*;
import org.springframework.transaction.annotation.*; 
<#assign field_pk_type = "String">
<#list clazz.fields as field>
  <#if field.primaryKey && !field.typePrimitive>
    <#assign field_pk_type = "${field.type}">
  </#if>
</#list>
<#assign persistence_unit_name = workspaceView.getActiveEditor().getDiagram().getGlobalAttribute("namespace")?replace('"','')>
/**
 * Realiza operação de Create, Read, Update e Delete no banco de dados.
 * Os métodos de create, edit, delete e outros estão abstraídos no JpaRepository
 * 
 * @see org.springframework.data.jpa.repository.JpaRepository
 * 
 * @generated
 */
@Repository("${clazz.name}DAO")
@Transactional(transactionManager="${persistence_unit_name}-TransactionManager")
public interface ${clazz.name}DAO extends JpaRepository<${clazz.name}, ${field_pk_type}> {

  /**
   * Obtém a instância de ${clazz.name} utilizando os identificadores
   * 
   <#list clazz.primaryKeys as field>
   * @param ${field.name}
   *          Identificador 
   </#list>
   * @return Instância relacionada com o filtro indicado
   * @generated
   */    
  @Query("SELECT entity FROM ${clazz.name} entity WHERE <#list clazz.primaryKeys as field>entity.${field.pathName} = :${field.name}<#if field_has_next> AND </#if></#list>")
  public ${clazz.name} findOne(<#list clazz.primaryKeys as field>@Param(value="${field.name}") ${field.type} ${field.name}<#if field_has_next>, </#if></#list>);

  /**
   * Remove a instância de ${clazz.name} utilizando os identificadores
   * 
   <#list clazz.primaryKeys as field>
   * @param ${field.name}
   *          Identificador 
   </#list>
   * @return Quantidade de modificações efetuadas
   * @generated
   */    
  @Modifying
  @Query("DELETE FROM ${clazz.name} entity WHERE <#list clazz.primaryKeys as field>entity.${field.pathName} = :${field.name}<#if field_has_next> AND </#if></#list>")
  public void delete(<#list clazz.primaryKeys as field>@Param(value="${field.name}") ${field.type} ${field.name}<#if field_has_next>, </#if></#list>);

<#list clazz.namedQueries as namedQuery><#assign keys = namedQuery.params?keys> 

<#assign method_named_query_name = "${namedQuery.name?uncap_first}">
  /**
   * Lista com paginação de acordo com a NamedQuery
   * 
   * @generated
   */
  @Query("${namedQuery.query}")
  public <#if !namedQuery.void>Page<${clazz.name}><#else>int</#if> ${method_named_query_name} (<#list keys as key>@Param(value="${key}") ${namedQuery.params[key]} ${key}<#if key_has_next>, </#if></#list> <#if !namedQuery.void><#if keys?size gt 0>, </#if>Pageable pageable </#if>);
  
</#list>

<#list clazz.oneToManyRelation as relation>
  /**
   * OneToMany Relation
   * @generated
   */
  @Query("SELECT entity FROM ${relation.clazz.name} entity WHERE <#list clazz.primaryKeys as field>entity.${relation.relationField.pathName}.${field.name} = :${field.name}<#if field_has_next> AND </#if></#list>")
  public Page<${relation.clazz.name}> find${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>@Param(value="${field.name}") ${field.type} ${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if> Pageable pageable );
</#list>



<#list clazz.manyToManyRelation as relation>
  /**
   * ManyToOne Relation
   * @generated
   */
  @Query("SELECT entity.${relation.relationClassField.name} FROM ${relation.associativeClassField.clazz.name} entity WHERE <#list clazz.primaryKeys as field>entity.${relation.associativeClassField.name}.${field.pathName} = :${field.name}<#if field_has_next> AND </#if></#list>")
  public Page<${relation.relationClassField.type}> list${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>@Param(value="${field.name}") ${field.type} ${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if> Pageable pageable);

  /**
   * ManyToOne Relation Delete
   * @generated
   */
  @Modifying
  @Query("DELETE FROM ${relation.associativeClassField.clazz.name} entity WHERE <#list clazz.primaryKeys as field>entity.${relation.associativeClassField.name}.${field.pathName} = :instance${field.name?cap_first}<#if field_has_next> AND </#if></#list><#if clazz.primaryKeys?size gt 0> AND </#if><#list relation.relationClass.primaryKeys as field>entity.${relation.relationClassField.pathName}.${field.pathName} = :relation${field.name?cap_first}<#if field_has_next> AND </#if></#list>")
  public int delete${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>@Param(value="instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if><#list relation.relationClass.primaryKeys as field>@Param(value="relation${field.name?cap_first}") ${field.type} relation${field.name?cap_first}<#if field_has_next>, </#if></#list>);

</#list>

<#if clazz.hasSearchableField()>
  <#assign filter_query = "">
  <#assign filter_index = 0>
  <#list clazz.fields as field>
    <#if field.isSearchable() && field.getType()=="java.lang.String" >
      <#if filter_index == 0>
        <#assign filter_query += "entity.${field.name} like concat('%',:search,'%')" >
        <#assign filter_index++>
      <#else>
        <#assign filter_query += " OR entity.${field.name} like concat('%',:search,'%')" >
      </#if>
    </#if>
  </#list>
  /**
   * Searchable fields - General search (Only strings fields)
   * @generated
   */
  @Query("SELECT entity FROM ${clazz.name} entity WHERE ${filter_query}")
  public Page<${clazz.name}> generalSearch (@Param(value="search") java.lang.String search, Pageable pageable );

  <#assign filter_query = "">
  <#assign filter_index = 0>
  <#list clazz.fields as field>
    <#if field.isSearchable() >
      <#if filter_index == 0>
        <#if field.getType()=="java.lang.String" >
          <#assign filter_query += "(:${field.name} is null OR entity.${field.name} like concat('%',:${field.name},'%'))" >
        <#else>
          <#assign filter_query += "(:${field.name} is null OR entity.${field.name} = :${field.name})" >
        </#if>
        <#assign filter_index++>
      <#else>
        <#if field.getType()=="java.lang.String" >
          <#assign filter_query += " AND (:${field.name} is null OR entity.${field.name} like concat('%',:${field.name},'%'))" >
        <#else>
          <#assign filter_query += " AND (:${field.name} is null OR entity.${field.name} = :${field.name})" >
        </#if>
      </#if>
    </#if>
  </#list>
  /**
   * Searchable fields - Specific search
   * @generated
   */
  @Query("SELECT entity FROM ${clazz.name} entity WHERE ${filter_query}")
  public Page<${clazz.name}> specificSearch (<#list clazz.fields as field><#if field.isSearchable()>@Param(value="${field.name}") ${field.type} ${field.name}, </#if></#list>Pageable pageable);
  
</#if>

}