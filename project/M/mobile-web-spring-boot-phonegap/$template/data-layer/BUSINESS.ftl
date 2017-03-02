package ${bussinessPackage}<#if subPackage??>.${subPackage}</#if>;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.util.*;
import ${daoPackage}.*;
import ${entityPackage}.*;
<#if subPackage??>
import ${daoPackage}.${subPackage}.*;
import ${entityPackage}.${subPackage}.*;
</#if>
<#list clazz.subPackageToImport as subPackageToImport>
<#if subPackage?? && subPackageToImport != subPackage >
import ${daoPackage}.${subPackageToImport}.*;
import ${entityPackage}.${subPackageToImport}.*;
</#if>
</#list>
<#assign isExistsEncrypt = false>
<#list clazz.fields as field>
  <#if field.isEncryption()>
    <#assign isExistsEncrypt = true>
  </#if>
</#list>
<#if isExistsEncrypt>
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
</#if>
<#assign hasCloudStorage = clazz.hasCloudStorage()>
<#if hasCloudStorage>
import cloud.CloudManager;
</#if>
<#assign persistence_unit_name = workspaceView.getActiveEditor().getDiagram().getGlobalAttribute("namespace")?replace('"','')>
<#assign qualified_repository_name = "${clazz.name}DAO">
<#assign clazz_name = "${clazz.name}Business">
<#assign class_entity_name = "${clazz.name}">
<#assign field_pk_type = "String">
<#list clazz.fields as field>
  <#if field.primaryKey && !field.typePrimitive>
    <#assign field_pk_type = "${field.type}">
  </#if>
</#list>

/**
 * Classe que representa a camada de negócios de ${clazz_name}
 * 
 * @generated
 **/
@Service("${clazz_name}")
public class ${clazz_name} {

  private static final Logger log = LoggerFactory.getLogger(${clazz_name}.class);
  <#if isExistsEncrypt>
  /**
   * Variável privada para verificação da criptofrafia
   * 
   * @generated
   */
  private String ENCRYPT = "$2a$10$";
  </#if>

  <#if hasCloudStorage>
  <#switch clazz.getCloudStorageType()>
  <#case "Dropbox">
  <#include "/dropbox/DROPBOX_CONSTANTS.ftl">
  <#break>
  </#switch>

  private final CloudManager cloudManager = CloudManager.newInstance().byID(<#list clazz.primaryKeys as field>"${field.name}"<#if field_has_next>, </#if></#list>).toFields(<#list clazz.getCloudStorageFields() as field>"${field}"<#if field_has_next>, </#if></#list>);
  </#if>

  /**
   * Instância da classe ${qualified_repository_name} que faz o acesso ao banco de dados
   * 
   * @generated
   */
  @Autowired
  @Qualifier("${qualified_repository_name}")
  protected ${clazz.name}DAO repository;

  // CRUD

  /**
   * Serviço exposto para novo registro de acordo com a entidade fornecida
   * 
   * @generated
   */
  public ${class_entity_name} post(final ${class_entity_name} entity) throws Exception {
    // begin-user-code  
    // end-user-code  
    <#list clazz.fields as field> 
    <#if field.isEncryption()>
    // isEncryption() ${field.name?cap_first}
    String form${field.name?cap_first} = entity.get${field.name?cap_first}();
    String encryption${field.name?cap_first} = new BCryptPasswordEncoder().encode(form${field.name?cap_first});
    entity.set${field.name?cap_first}(encryption${field.name?cap_first});      
    </#if>
    </#list>
    <#if hasCloudStorage>
    <#switch clazz.getCloudStorageType()>
    <#case "Dropbox">
    <#include "/dropbox/DROPBOX_POST.ftl">
    <#break>
    </#switch>
    <#else>
    ${class_entity_name} result = null;
    try {
      result = repository.save(entity);
    } catch (Exception e) {
      log.error(e.getMessage());
    }
    </#if>
    // begin-user-code
    // end-user-code
    return result;
  }

  /**
   * Serviço exposto para salvar alterações de acordo com a entidade fornecida
   * 
   * @generated
   */
  public ${class_entity_name} put(final ${class_entity_name} entity) throws Exception {
    // begin-user-code  
    // end-user-code
    <#list clazz.fields as field> 
    <#if field.isEncryption()>
    // isEncryption() ${field.name?cap_first}
    String form${field.name?cap_first} = entity.get${field.name?cap_first}();
    String encryption${field.name?cap_first} = form${field.name?cap_first}.startsWith(ENCRYPT) ? form${field.name?cap_first} : new BCryptPasswordEncoder().encode(form${field.name?cap_first});
    entity.set${field.name?cap_first}(encryption${field.name?cap_first});      
    </#if>
    </#list>  
    <#if hasCloudStorage>
    <#switch clazz.getCloudStorageType()>
    <#case "Dropbox">
    <#include "/dropbox/DROPBOX_PUT.ftl">
    <#break>
    </#switch>
    <#else>
    ${class_entity_name} result = null;
    try {
      result = repository.saveAndFlush(entity);
    } catch (Exception e) {
      log.error(e.getMessage());
    }
    </#if>
    // begin-user-code
    // end-user-code
    return result;
  }

  /**
   * Serviço exposto para remover a entidade de acordo com o id fornecido
   * 
   * @generated
   */
  public void delete(<#list clazz.primaryKeys as field>${field.type} ${field.name}<#if field_has_next>, </#if></#list>) throws Exception {
    // begin-user-code  
    // end-user-code
    ${class_entity_name} entity = this.get(<#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list>);
    try {
      this.repository.delete(entity);
      <#if hasCloudStorage>
      <#switch clazz.getCloudStorageType()>
      <#case "Dropbox">
      <#include "/dropbox/DROPBOX_DELETE.ftl">
      <#break>
      </#switch>
      </#if>
    } catch (Exception e) {
      log.error(e.getMessage());
    }
    // begin-user-code  
    // end-user-code        
  }
  
  /**
   * Serviço exposto para recuperar a entidade de acordo com o id fornecido
   * 
   * @generated
   */
  public ${class_entity_name} get(<#list clazz.primaryKeys as field>${field.type} ${field.name}<#if field_has_next>, </#if></#list>) throws Exception {
    // begin-user-code  
    // end-user-code
    ${class_entity_name} result = repository.findOne(<#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list>);
    <#if hasCloudStorage>
    <#switch clazz.getCloudStorageType()>
    <#case "Dropbox">
    <#include "/dropbox/DROPBOX_GET.ftl">
    <#break>
    </#switch>
    </#if>
    // begin-user-code
    // end-user-code
    return result;
  }

  // CRUD
  
<#list clazz.namedQueries as namedQuery><#assign keys = namedQuery.params?keys>
<#assign method_named_query_name = "${namedQuery.name?uncap_first}">
  /**
   * Lista com paginação de acordo com a NamedQuery
   * 
   * @generated
   */
  public <#if !namedQuery.void>Page<${clazz.name}><#else>int</#if> ${method_named_query_name}(<#list keys as key> ${namedQuery.params[key]} ${key}<#if key_has_next>, </#if></#list><#if !namedQuery.void><#if keys?size gt 0>, </#if>Pageable pageable</#if>){
    // begin-user-code
    // end-user-code
    <#if !namedQuery.void>Page<${clazz.name}><#else>int</#if> result = repository.${method_named_query_name}(<#list keys as key> ${key}<#if key_has_next>, </#if></#list><#if !namedQuery.void><#if keys?size gt 0>, </#if>pageable</#if>);
    <#if hasCloudStorage>
    <#switch clazz.getCloudStorageType()>
    <#case "Dropbox">
    <#include "/dropbox/DROPBOX_LIST.ftl">
    <#break>
    </#switch>
    </#if>
    // begin-user-code
    // end-user-code
    return result;
  }
</#list>
<#list clazz.oneToManyRelation as relation>
  <#if relation.clazz.hasSearchableField()>
  /**
   * @generated modifiable
   * OneToMany Relation - Searchable fields - General search (Only strings fields)
   */  
  public Page<${relation.clazz.name}> find${relation.relationName?cap_first}GeneralSearch(java.lang.String search, <#list clazz.primaryKeys as field>${field.type} ${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if> Pageable pageable) {
    // begin-user-code
    // end-user-code  
    Page<${relation.clazz.name}> result = repository.find${relation.relationName?cap_first}GeneralSearch(search, <#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if> pageable);
    // begin-user-code  
    // end-user-code        
    return result;    
  }
  
  /**
   * @generated modifiable
   * OneToMany Relation - Searchable fields - Specific search
   */  
  public Page<${relation.clazz.name}> find${relation.relationName?cap_first}SpecificSearch(<#list clazz.primaryKeys as field>${field.type} ${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if><#list relation.clazz.fields as field><#if field.isSearchable()>${field.type} ${field.name}, </#if></#list>Pageable pageable) {
    // begin-user-code
    // end-user-code  
    Page<${relation.clazz.name}> result = repository.find${relation.relationName?cap_first}SpecificSearch(<#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if><#list relation.clazz.fields as field><#if field.isSearchable()>${field.name}, </#if></#list>pageable);
    // begin-user-code  
    // end-user-code        
    return result;    
  }
  </#if>
  
  /**
   * @generated modifiable
   * OneToMany Relation
   */  
  public Page<${relation.clazz.name}> find${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>${field.type} ${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>Pageable pageable) {
    // begin-user-code
    // end-user-code  
    Page<${relation.clazz.name}> result = repository.find${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>pageable);
    // begin-user-code  
    // end-user-code        
    return result;    
  }
</#list>
<#list clazz.manyToManyRelation as relation>
  <#if relation.relationClass.hasSearchableField()>
  /**
   * @generated modifiable
   * ManyToMany Relation - Searchable fields - General search (Only strings fields)
   */  
  public Page<${relation.relationClassField.type}> list${relation.relationName?cap_first}GeneralSearch(java.lang.String search, <#list clazz.primaryKeys as field>${field.type} ${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>Pageable pageable) {
    // begin-user-code
    // end-user-code  
    Page<${relation.relationClassField.type}> result = repository.list${relation.relationName?cap_first}GeneralSearch(search, <#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>pageable);
    // begin-user-code
    // end-user-code
    return result;            
  }
  
  /**
   * @generated modifiable
   * ManyToMany Relation - Searchable fields - Specific search
   */  
  public Page<${relation.relationClassField.type}> list${relation.relationName?cap_first}SpecificSearch(<#list clazz.primaryKeys as field>${field.type} ${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if><#list relation.relationClass.fields as field><#if field.isSearchable()>${field.type} ${field.name}, </#if></#list>Pageable pageable) {
    // begin-user-code
    // end-user-code  
    Page<${relation.relationClassField.type}> result = repository.list${relation.relationName?cap_first}SpecificSearch(<#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if><#list relation.relationClass.fields as field><#if field.isSearchable()>${field.name}, </#if></#list>pageable);
    // begin-user-code
    // end-user-code
    return result;            
  }
  
  </#if>
  /**
   * @generated modifiable
   * ManyToMany Relation
   */  
  public Page<${relation.relationClassField.type}> list${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>${field.type} ${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>Pageable pageable) {
    // begin-user-code
    // end-user-code  
    Page<${relation.relationClassField.type}> result = repository.list${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>pageable);
    // begin-user-code
    // end-user-code
    return result;            
  }
  
  /**
   * @generated modifiable
   * ManyToMany Relation
   */    
  public int delete${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if><#list relation.relationClass.primaryKeys as field>${field.type} relation${field.name?cap_first}<#if field_has_next>, </#if></#list>) {
    // begin-user-code
    // end-user-code  
    int result = repository.delete${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if><#list relation.relationClass.primaryKeys as field>relation${field.name?cap_first}<#if field_has_next>, </#if></#list>);
    // begin-user-code
    // end-user-code  
    return result;  
  }
</#list>
<#if clazz.hasSearchableField()>
  /**
   * Searchable fields - General search (Only strings fields)
   * @generated
   */
  public Page<${clazz.name}> generalSearch(java.lang.String search, Pageable pageable) {
    return repository.generalSearch(search, pageable);
  }
  
  /**
   * Searchable fields - Specific search
   * @generated
   */
  public Page<${clazz.name}> specificSearch(<#list clazz.fields as field><#if field.isSearchable()>${field.type} ${field.name}, </#if></#list>Pageable pageable) {
    return repository.specificSearch(<#list clazz.fields as field><#if field.isSearchable()>${field.name}, </#if></#list>pageable);
  }
</#if>
}