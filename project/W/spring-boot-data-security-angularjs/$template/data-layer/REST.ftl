package ${restPackage}<#if subPackage??>.${subPackage}</#if>;

import org.springframework.data.domain.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.*;
import org.springframework.data.web.PagedResourcesAssembler;
import org.springframework.hateoas.PagedResources;
import org.springframework.http.*;
import org.springframework.beans.factory.annotation.*;
import java.util.*;
import ${entityPackage}.*;
import ${bussinessPackage}.*;
<#if subPackage??>
import ${entityPackage}.${subPackage}.*;
import ${bussinessPackage}.${subPackage}.*;
</#if>
<#list clazz.subPackageToImport as subPackageToImport>
<#if subPackage?? && subPackageToImport != subPackage >
import ${bussinessPackage}.${subPackageToImport}.*;
import ${entityPackage}.${subPackageToImport}.*;
</#if>
</#list>

<#assign class_name = "${clazz.name}REST">
<#assign class_entity_name = "${clazz.name}">
<#assign class_business_name = "${clazz.name}Business">
<#assign class_business_variable_name = "${clazz.name?uncap_first}Business">
<#if clazz.restPath != "" >
<#assign request_mapping_value = clazz.restPath + "/" + clazz.name >
<#else>
<#assign request_mapping_value = restPath + "/" + clazz.name >
</#if>
<#assign field_pk_type = "String">
<#list clazz.fields as field>
  <#if field.primaryKey && !field.typePrimitive>
    <#assign field_pk_type = "${field.type}">
  </#if>
</#list>
<#assign field_pk_type = "String">
<#list clazz.fields as field>
  <#if field.primaryKey && !field.typePrimitive>
    <#assign field_pk_type = "${field.type}">
  </#if>
</#list>
/**
 * Controller para expor serviços REST de ${class_entity_name}
 * 
 * @generated
 **/
@RestController
@RequestMapping(value = "${request_mapping_value?trim}")
public class ${class_name} {

  /**
   * Classe de negócio para manipulação de dados
   * 
   * @generated
   */
  @Autowired
  @Qualifier("${class_business_name}")
  private ${class_business_name} ${class_business_variable_name};
  
<#list clazz.allRelations as relation>
    <#assign relation_name = "${relation.name}Business">
    <#if relation_name != class_business_name >
  /**
   * @generated
   */
  @Autowired
  @Qualifier("${relation.name}Business")
  private ${relation.name}Business ${relation.name?uncap_first}Business;
    </#if>
</#list>
  /**
   * Serviço exposto para novo registro de acordo com a entidade fornecida
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.POST)
  public ${class_entity_name} post(@Validated @RequestBody final ${class_entity_name} entity) throws Exception {
    return ${class_business_variable_name}.post(entity);
  }

  /**
   * Serviço exposto para salvar alterações de acordo com a entidade fornecida
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.PUT)
  public ${class_entity_name} put(@Validated @RequestBody final ${class_entity_name} entity) throws Exception {
    return ${class_business_variable_name}.put(entity);
  }

  /**
   * Serviço exposto para salvar alterações de acordo com a entidade e id fornecidos
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.PUT, value = "/<#list clazz.primaryKeys as field>{${field.name}}<#if field_has_next>/</#if></#list>")
  public ${class_entity_name} put(@Validated @RequestBody final ${class_entity_name} entity, <#list clazz.primaryKeys as field>@PathVariable("${field.name}") ${field.type} ${field.name}<#if field_has_next>, </#if></#list>) throws Exception {
    return ${class_business_variable_name}.put(entity);
  }  

  /**
   * Serviço exposto para remover a entidade de acordo com o id fornecido
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.DELETE, value = "/<#list clazz.primaryKeys as field>{${field.name}}<#if field_has_next>/</#if></#list>")
  public void delete(<#list clazz.primaryKeys as field>@PathVariable("${field.name}") ${field.type} ${field.name}<#if field_has_next>, </#if></#list>) throws Exception {
    ${class_business_variable_name}.delete(<#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list>);
  }

<#list clazz.namedQueries as namedQuery><#assign keys = namedQuery.params?keys><#if namedQuery.isRest()>    
<#assign method_named_query_name = "${namedQuery.name?uncap_first}">
  /**
   * NamedQuery ${namedQuery.name}
   * @generated
   */
  @RequestMapping(method = RequestMethod.<#if namedQuery.queryType == "select">GET</#if><#if namedQuery.queryType == "update">PUT</#if><#if namedQuery.queryType == "delete">DELETE</#if>
  <#if namedQuery.name != "list">, value="/${namedQuery.name}<#if keys?size gt 0>/</#if><#list keys as key>{${key}}<#if key_has_next>/</#if></#list>"</#if>)    
  public <#if !namedQuery.void>HttpEntity<PagedResources<${clazz.name}>><#else>int</#if> ${namedQuery.name}Params (<#list keys as key>@PathVariable("${key}") ${namedQuery.params[key]} ${key}<#if key_has_next>, </#if></#list><#if !namedQuery.void><#if keys?size gt 0>, </#if>Pageable pageable, PagedResourcesAssembler assembler</#if>){
    return new ResponseEntity<>(assembler.toResource(${class_business_variable_name}.${method_named_query_name}(<#list keys as key>${key}<#if key_has_next>, </#if></#list><#if !namedQuery.void><#if keys?size gt 0>, </#if>pageable</#if>)), HttpStatus.OK);    
  }
</#if> 
</#list>  

<#list clazz.oneToManyRelation as relation>
<#if relation.clazz.hasSearchableField()>
  /**
   * OneToMany Relationship GET - Searchable fields - General search (Only strings fields)
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET, value="/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}/generalSearch")    
  public HttpEntity<PagedResources<${relation.clazz.name}>> find${relation.relationName?cap_first}GeneralSearch(java.lang.String search, <#list clazz.primaryKeys as field>@PathVariable("instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>Pageable pageable, PagedResourcesAssembler assembler) {
    return new ResponseEntity<>(assembler.toResource(${class_business_variable_name}.find${relation.relationName?cap_first}GeneralSearch(search, <#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>pageable)), HttpStatus.OK);
  }
  
  /**
   * OneToMany Relationship GET - Searchable fields - Specific search
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  , value="/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}/specificSearch")    
  public HttpEntity<PagedResources<${relation.clazz.name}>> find${relation.relationName?cap_first}SpecificSearch(<#list clazz.primaryKeys as field>@PathVariable("instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if><#list relation.clazz.fields as field><#if field.isSearchable()><#if (field.isTime() || field.isDate() || field.isTimestamp())>java.lang.String<#else>${field.type}</#if> ${field.name}, </#if></#list>Pageable pageable, PagedResourcesAssembler assembler) {
    <#list relation.clazz.fields as field>
    <#if field.isSearchable()>
      <#if (field.isTime() || field.isDate() || field.isTimestamp())>
    Date ${field.name}Aux = null;
    if (${field.name} != null && ${field.name}.length() > 0 ) {
      try {
        <#if field.isTimestamp()>
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        <#elseif field.isTime()>
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("HH:mm:ss");
        <#else>
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("dd/MM/yyyy");
        </#if>
        ${field.name}Aux = formatter.parse(${field.name});
      } catch (Exception e) {
          e.printStackTrace();
      }
    }
      </#if> 
    </#if>
  </#list>
    return new ResponseEntity<>(assembler.toResource(${class_business_variable_name}.find${relation.relationName?cap_first}SpecificSearch(<#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if><#list relation.clazz.fields as field><#if field.isSearchable()><#if (field.isTime() || field.isDate() || field.isTimestamp())>${field.name}Aux, <#else>${field.name}, </#if></#if></#list>pageable)), HttpStatus.OK);
  }
</#if>

  /**
   * OneToMany Relationship GET
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  , value="/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}")    
  public HttpEntity<PagedResources<${relation.clazz.name}>> find${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>@PathVariable("instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>Pageable pageable, PagedResourcesAssembler assembler) {
    return new ResponseEntity<>(assembler.toResource(${class_business_variable_name}.find${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>pageable)), HttpStatus.OK);
  }

  /**
   * OneToMany Relationship DELETE 
   * @generated
   */  
  @RequestMapping(method = RequestMethod.DELETE
  , value="/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}/<#list relation.clazz.primaryKeys as field>{relation${field.name?cap_first}}<#if field_has_next>/</#if></#list>")    
  public void delete${relation.relationName?cap_first}(<#list relation.clazz.primaryKeys as field>@PathVariable("relation${field.name?cap_first}") ${field.type} relation${field.name?cap_first}<#if field_has_next>, </#if></#list>) throws Exception {
    this.${relation.clazz.name?uncap_first}Business.delete(<#list relation.clazz.primaryKeys as field>relation${field.name?cap_first}<#if field_has_next>, </#if></#list>);
  }
  
  /**
   * OneToMany Relationship PUT
   * @generated
   */  
  @RequestMapping(method = RequestMethod.PUT
  , value="/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}/<#list relation.clazz.primaryKeys as field>{relation${field.name?cap_first}}<#if field_has_next>/</#if></#list>")
  public ${relation.clazz.name} put${relation.relationName?cap_first}(@Validated @RequestBody final ${relation.clazz.name} entity, <#list relation.clazz.primaryKeys as field>@PathVariable("relation${field.name?cap_first}") ${field.type} relation${field.name?cap_first}<#if field_has_next>, </#if></#list>) throws Exception {
    return this.${relation.clazz.name?uncap_first}Business.put(entity);
  }  
  
  /**
   * OneToMany Relationship POST
   * @generated
   */  
  @RequestMapping(method = RequestMethod.POST
  , value="/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}")
  public ${relation.clazz.name} post${relation.relationName?cap_first}(@Validated @RequestBody final ${relation.clazz.name} entity, <#list clazz.primaryKeys as field>@PathVariable("instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list>) throws Exception {
  ${clazz.name} ${relation.relationField.name} = this.${class_business_variable_name}.get(<#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list>);
  entity.set${relation.relationField.name?cap_first}(${relation.relationField.name});
    return this.${relation.clazz.name?uncap_first}Business.post(entity);
  }   

</#list>
<#list clazz.manyToManyRelation as relation>
  <#if relation.relationClass.hasSearchableField()>
  /**
   * ManyToMany Relationship GET - Searchable fields - General search (Only strings fields)
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  ,value="/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}/generalSearch")
  public HttpEntity<PagedResources<${relation.relationClassField.type}>> list${relation.relationName?cap_first}GeneralSearch(java.lang.String search, <#list clazz.primaryKeys as field>@PathVariable("instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>Pageable pageable, PagedResourcesAssembler assembler) {
    return new ResponseEntity<>(assembler.toResource(${class_business_variable_name}.list${relation.relationName?cap_first}GeneralSearch(search, <#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>pageable)), HttpStatus.OK); 
  }
  
  /**
   * ManyToMany Relationship GET - Searchable fields - Specific search
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  ,value="/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}/specificSearch")
  public HttpEntity<PagedResources<${relation.relationClassField.type}>> list${relation.relationName?cap_first}SpecificSearch(<#list clazz.primaryKeys as field>@PathVariable("instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if><#list relation.relationClass.fields as field><#if field.isSearchable()><#if (field.isTime() || field.isDate() || field.isTimestamp())>java.lang.String<#else>${field.type}</#if> ${field.name}, </#if></#list>Pageable pageable, PagedResourcesAssembler assembler) {
  <#list relation.relationClass.fields as field>
    <#if field.isSearchable()>
      <#if (field.isTime() || field.isDate() || field.isTimestamp())>
    Date ${field.name}Aux = null;
    if (${field.name} != null && ${field.name}.length() > 0 ) {
      try {
        <#if field.isTimestamp()>
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        <#elseif field.isTime()>
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("HH:mm:ss");
        <#else>
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("dd/MM/yyyy");
        </#if>
        ${field.name}Aux = formatter.parse(${field.name});
      } catch (Exception e) {
          e.printStackTrace();
      }
    }
      </#if> 
    </#if>
  </#list>  
    return new ResponseEntity<>(assembler.toResource(${class_business_variable_name}.list${relation.relationName?cap_first}SpecificSearch(<#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if><#list relation.relationClass.fields as field><#if field.isSearchable()><#if (field.isTime() || field.isDate() || field.isTimestamp())>${field.name}Aux, <#else>${field.name}, </#if></#if></#list>pageable)), HttpStatus.OK); 
  }
  </#if>

  /**
   * ManyToMany Relationship GET
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  ,value="/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}")
  public HttpEntity<PagedResources<${relation.relationClassField.type}>> list${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>@PathVariable("instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>Pageable pageable, PagedResourcesAssembler assembler) {
    return new ResponseEntity<>(assembler.toResource(${class_business_variable_name}.list${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>pageable)), HttpStatus.OK); 
  }

  /**
   * ManyToMany Relationship POST
   * @generated
   */  
  @RequestMapping(method = RequestMethod.POST
  ,value="/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}")
  public ${clazz.name} post${relation.relationName?cap_first}(@Validated @RequestBody final ${relation.relationClassField.type} entity, <#list clazz.primaryKeys as field>@PathVariable("instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list>) throws Exception {
    ${relation.relationClassField.clazz.name} new${relation.relationClassField.clazz.name?cap_first} = new ${relation.relationClassField.clazz.name}();

    ${clazz.name} instance = this.${class_business_variable_name}.get(<#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list>);

    new${relation.relationClassField.clazz.name?cap_first}.set${relation.relationClassField.name?cap_first}(entity);
    new${relation.relationClassField.clazz.name?cap_first}.set${relation.associativeClassField.name?cap_first}(instance);
    
    this.${relation.relationClassField.clazz.name?uncap_first}Business.post(new${relation.relationClassField.clazz.name?cap_first});

    return new${relation.relationClassField.clazz.name?cap_first}.get${relation.associativeClassField.name?cap_first}();
  }   

  /**
   * ManyToMany Relationship DELETE
   * @generated
   */  
  @RequestMapping(method = RequestMethod.DELETE
  ,value="/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}/<#list relation.relationClass.primaryKeys as field>{relation${field.name?cap_first}}<#if field_has_next>/</#if></#list>")
  public void delete${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>@PathVariable("instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list>, <#list relation.relationClass.primaryKeys as field>@PathVariable("relation${field.name?cap_first}") ${field.type} relation${field.name?cap_first}<#if field_has_next>, </#if></#list>) {
    this.${clazz.name?uncap_first}Business.delete${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if><#list relation.relationClass.primaryKeys as field>relation${field.name?cap_first}<#if field_has_next>, </#if></#list>);
  }  
</#list> 

<#if clazz.hasSearchableField()>
  /**
   * Searchable fields - General search (Only strings fields)
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET, value = "/generalSearch")
  public HttpEntity<PagedResources<${clazz.name}>> generalSearch(java.lang.String search, Pageable pageable, PagedResourcesAssembler assembler) {
    return new ResponseEntity<>(assembler.toResource(${clazz.name?uncap_first}Business.generalSearch(search, pageable)), HttpStatus.OK);
  }
  
  /**
   * Searchable fields - Specific search
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET, value = "/specificSearch")
  public HttpEntity<PagedResources<${clazz.name}>> specificSearch(<#list clazz.fields as field><#if field.isSearchable()><#if (field.isTime() || field.isDate() || field.isTimestamp())>java.lang.String<#else>${field.type}</#if> ${field.name}, </#if></#list>Pageable pageable, PagedResourcesAssembler assembler) {
  <#list clazz.fields as field>
    <#if field.isSearchable()>
      <#if (field.isTime() || field.isDate() || field.isTimestamp())>
    Date ${field.name}Aux = null;
    if (${field.name} != null && ${field.name}.length() > 0 ) {
      try {
        <#if field.isTimestamp()>
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        <#elseif field.isTime()>
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("HH:mm:ss");
        <#else>
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("dd/MM/yyyy");
        </#if>
        ${field.name}Aux = formatter.parse(${field.name});
      } catch (Exception e) {
          e.printStackTrace();
      }
    }
      </#if> 
    </#if>
  </#list>
    return new ResponseEntity<>(assembler.toResource(${clazz.name?uncap_first}Business.specificSearch(<#list clazz.fields as field><#if field.isSearchable()><#if (field.isTime() || field.isDate() || field.isTimestamp())>${field.name}Aux, <#else>${field.name}, </#if></#if></#list>pageable)), HttpStatus.OK);
  }
</#if>

  /**
   * Serviço exposto para recuperar a entidade de acordo com o id fornecido
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET, value = "/<#list clazz.primaryKeys as field>{${field.name}}<#if field_has_next>/</#if></#list>")
  public ${class_entity_name} get(<#list clazz.primaryKeys as field>@PathVariable("${field.name}") ${field.type} ${field.name}<#if field_has_next>, </#if></#list>) throws Exception {
    return ${class_business_variable_name}.get(<#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list>);
  }
}