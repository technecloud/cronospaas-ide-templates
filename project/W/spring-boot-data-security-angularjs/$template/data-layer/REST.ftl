package ${restPackage};

import org.springframework.data.domain.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.*;

import org.springframework.http.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.web.bind.annotation.*;

import java.util.*;

import ${entityPackage}.*;
import ${bussinessPackage}.*;

<#assign class_name = "${clazz.name}REST">
<#assign class_entity_name = "${clazz.name}">
<#assign class_business_name = "${clazz.name}Business">
<#assign class_business_variable_name = "${clazz.name?uncap_first}Business">
<#assign request_mapping_value = restPath + "/" + clazz.name >

<#assign field_pk_type = "String">
<#list clazz.fields as field>
  <#if field.primaryKey && !field.typePrimitive>
    <#assign field_pk_type = "${field.type}">
  </#if>
</#list>

/**
 * Controller para expor serviços REST de ${class_entity_name}
 * 
 * @author ${UserName}
 * @version 1.0
 * @generated
 **/
@RestController
@RequestMapping(value = "${request_mapping_value}")
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
  /**
   * @generated
   */
    @Autowired
    @Qualifier("${relation.name}Business")
    private ${relation.name}Business ${relation.name?uncap_first}Business;
</#list>   

    /**
     * Serviço exposto para novo registro de acordo com a entidade fornecida
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.POST)
    public ${class_entity_name} post(@Validated @RequestBody final ${class_entity_name} entity) throws Exception {
        ${class_business_variable_name}.getRepository().save(entity);
        return entity;
    }

    /**
     * Serviço exposto para recuperar a entidade de acordo com o id fornecido
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.GET, value = "/<#list clazz.primaryKeys as field>{${field.name}}<#if field_has_next>/</#if></#list>")
    public ResponseEntity<?> get(<#list clazz.primaryKeys as field>@PathVariable("${field.name}") ${field.type} ${field.name}<#if field_has_next>, </#if></#list>) throws Exception {
        ${class_entity_name} entity = ${class_business_variable_name}.getRepository().findOne(<#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list>);
        return entity == null ? ResponseEntity.status(404).build() : ResponseEntity.ok(entity);
    }

    /**
     * Serviço exposto para salvar alterações de acordo com a entidade fornecida
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity<?> put(@Validated @RequestBody final ${class_entity_name} entity) throws Exception {
        return ResponseEntity.ok( ${class_business_variable_name}.getRepository().saveAndFlush(entity));
    }

    /**
     * Serviço exposto para salvar alterações de acordo com a entidade e id fornecidos
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.PUT, value = "/<#list clazz.primaryKeys as field>{${field.name}}<#if field_has_next>/</#if></#list>")
    public ${class_entity_name} put(@PathVariable("id") final ${field_pk_type} id, @Validated @RequestBody final ${class_entity_name} entity) throws Exception {
        return ${class_business_variable_name}.getRepository().saveAndFlush(entity);
    }


    /**
     * Serviço exposto para remover a entidade de acordo com o id fornecido
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.DELETE, value = "/<#list clazz.primaryKeys as field>{${field.name}}<#if field_has_next>/</#if></#list>")
    public void delete(<#list clazz.primaryKeys as field>@PathVariable("${field.name}") ${field.type} ${field.name}<#if field_has_next>, </#if></#list>) throws Exception {
         ${class_business_variable_name}.getRepository().delete(<#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list>);
    }

<#list clazz.namedQueries as namedQuery><#assign keys = namedQuery.params?keys><#if namedQuery.isRest()>    
<#assign method_named_query_name = "${namedQuery.name?uncap_first}">

  /**
   * NamedQuery ${namedQuery.name}
   * @generated
   */
  @RequestMapping(method = RequestMethod.<#if namedQuery.queryType == "select">GET</#if><#if namedQuery.queryType == "update">PUT</#if><#if namedQuery.queryType == "delete">DELETE</#if>
  <#if namedQuery.name != "list">, value="/${namedQuery.name}<#if keys?size gt 0>/</#if><#list keys as key>{${key}}<#if key_has_next>/</#if></#list>"</#if>)    
  public <#if !namedQuery.void> List<${clazz.name}><#else>int</#if> ${namedQuery.name}Params (<#list keys as key>@PathVariable("${key}") ${namedQuery.params[key]} ${key}<#if key_has_next>, </#if></#list><#if !namedQuery.void><#if keys?size gt 0>, </#if>@RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset</#if>){
      return ${class_business_variable_name}.getRepository().${method_named_query_name}(<#list keys as key>${key}<#if key_has_next>, </#if></#list><#if !namedQuery.void><#if keys?size gt 0>, </#if>new PageRequest(offset, limit) </#if>  );  
  }
</#if>
</#list>  

<#list clazz.oneToManyRelation as relation>
  /**
   * OneToMany Relationship GET
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  , value="/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}")    
  public List<${relation.clazz.name}> find${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>@PathVariable("instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>@RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset) {
    return ${class_business_variable_name}.find${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if> new PageRequest(offset, limit) );
  }

  /**
   * OneToMany Relationship DELETE 
   * @generated
   */  
  @RequestMapping(method = RequestMethod.DELETE
  , value="/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}/<#list relation.clazz.primaryKeys as field>{relation${field.name?cap_first}}<#if field_has_next>/</#if></#list>")    
  public ResponseEntity<?> delete${relation.relationName?cap_first}(<#list relation.clazz.primaryKeys as field>@PathVariable("relation${field.name?cap_first}") ${field.type} relation${field.name?cap_first}<#if field_has_next>, </#if></#list>) {
      try {
        this.${relation.clazz.name?uncap_first}Business.getRepository().delete(<#list relation.clazz.primaryKeys as field>relation${field.name?cap_first}<#if field_has_next>, </#if></#list>);
        return ResponseEntity.ok().build();
      } catch (Exception e) {
        return ResponseEntity.status(404).build();
      }
  }

</#list>


<#list clazz.manyToManyRelation as relation>
  /**
   * ManyToMany Relationship GET
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  ,value="/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}")
  public List<${relation.relationClassField.type}> list${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>@PathVariable("instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if> @RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset ) {
    return ${class_business_variable_name}.list${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if> new PageRequest(offset, limit) );
  }

  /**
   * ManyToMany Relationship POST
   * @generated
   */  
  @RequestMapping(method = RequestMethod.POST
  ,value="/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}")
  public ResponseEntity<?> post${relation.relationName?cap_first}(@Validated @RequestBody final ${relation.relationClassField.type} entity, <#list clazz.primaryKeys as field>@PathVariable("instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list>) {
      ${relation.relationClassField.clazz.name} new${relation.relationClassField.clazz.name?cap_first} = new ${relation.relationClassField.clazz.name}();

      ${clazz.name} instance = this.${class_business_variable_name}.getRepository().findOne(<#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list>);

      new${relation.relationClassField.clazz.name?cap_first}.set${relation.relationClassField.name?cap_first}(entity);
      new${relation.relationClassField.clazz.name?cap_first}.set${relation.associativeClassField.name?cap_first}(instance);
      
      this.${relation.relationClassField.clazz.name?uncap_first}Business.getRepository().saveAndFlush(new${relation.relationClassField.clazz.name?cap_first});

      return ResponseEntity.ok(new${relation.relationClassField.clazz.name?cap_first}.get${relation.associativeClassField.name?cap_first}());
  }   

  /**
   * ManyToMany Relationship DELETE
   * @generated
   */  
  @RequestMapping(method = RequestMethod.DELETE
  ,value="/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}/<#list relation.relationClass.primaryKeys as field>{relation${field.name?cap_first}}<#if field_has_next>/</#if></#list>")
  public ResponseEntity<?> delete${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>@PathVariable("instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list>, <#list relation.relationClass.primaryKeys as field>@PathVariable("relation${field.name?cap_first}") ${field.type} relation${field.name?cap_first}<#if field_has_next>, </#if></#list>) {
      this.${clazz.name?uncap_first}Business.delete${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if><#list relation.relationClass.primaryKeys as field>relation${field.name?cap_first}<#if field_has_next>, </#if></#list>);
      return ResponseEntity.ok().build();
  }  


</#list>

}