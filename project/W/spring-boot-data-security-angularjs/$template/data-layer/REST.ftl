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

/**
 * Controller para expor serviços REST de ${class_entity_name}
 * 
 * @author ${UserName}
 * @version 1.0
 * @since ${.now?string("yyyy-MM-dd")}
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
     * Serviço exposto para recuperar entidades de acordo com os paramêtros para limite
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.GET)
    public List<${class_entity_name}> get(@RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset) throws Exception {
        Page<${class_entity_name}> pages = ${class_business_variable_name}.getRepository().findAll(new PageRequest(offset, limit));
        return pages.getContent();
    }

    /**
     * Serviço exposto para recuperar a entidade de acordo com o id fornecido
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public ResponseEntity<?> get(@PathVariable("id") final String id) throws Exception {
        ${class_entity_name} entity = ${class_business_variable_name}.getRepository().findOne(id);
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
    @RequestMapping(method = RequestMethod.PUT, value = "/{id}")
    public ${class_entity_name} put(@PathVariable("id") final String id, @Validated @RequestBody final ${class_entity_name} entity) throws Exception {
        return ${class_business_variable_name}.getRepository().saveAndFlush(entity);
    }


    /**
     * Serviço exposto para remover a entidade fornecida
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.DELETE)
    public void delete(@Validated @RequestBody final ${class_entity_name} entity) throws Exception {
         ${class_business_variable_name}.getRepository().delete(entity);
    }

    /**
     * Serviço exposto para remover a entidade de acordo com o id fornecido
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
    public void delete(@PathVariable("id") final String id) throws Exception {
         ${class_business_variable_name}.getRepository().delete(id);
    }


<#list clazz.namedQueries as namedQuery><#assign keys = namedQuery.params?keys><#if namedQuery.isRest()>    
<#if namedQuery.name != "list">
<#if keys?size gt 0>    
<#assign method_named_query_name = "${namedQuery.name?uncap_first}">

  /**
   * NamedQuery ${namedQuery.name}
   * @generated
   */
  @RequestMapping(method = RequestMethod.<#if namedQuery.queryType == "select">GET</#if><#if namedQuery.queryType == "update">PUT</#if><#if namedQuery.queryType == "delete">DELETE</#if>
  , value="/${namedQuery.name}")    
  public <#if !namedQuery.void> List<${clazz.name}><#else>int</#if> ${namedQuery.name}Params (<#list keys as key>@RequestParam("${key}") ${namedQuery.params[key]} ${key}<#if key_has_next>, </#if></#list><#if !namedQuery.void><#if keys?size gt 0>, </#if>@RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset</#if>){
      return ${class_business_variable_name}.getRepository().${method_named_query_name}(<#list keys as key>${key}<#if key_has_next>, </#if></#list><#if !namedQuery.void><#if keys?size gt 0>, </#if>new PageRequest(offset, limit) </#if>  );  
  }
</#if>  
</#if>
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
  public ResponseEntity<?> post${relation.relationName?cap_first}(${relation.relationClassField.type} entity, <#list clazz.primaryKeys as field>@PathVariable("instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list>) {
      ${relation.relationClassField.clazz.name} new${relation.relationClassField.clazz.name?cap_first} = new ${relation.relationClassField.clazz.name}();

      ${clazz.name} instance = this.${class_business_variable_name}.getRepository().findOne(<#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list>);

      new${relation.relationClassField.clazz.name?cap_first}.set${relation.relationClassField.name?cap_first}(entity);
      new${relation.relationClassField.clazz.name?cap_first}.set${relation.associativeClassField.name?cap_first}(instance);
      
      this.${relation.relationClassField.clazz.name?uncap_first}Business.getRepository().saveAndFlush(new${relation.relationClassField.clazz.name?cap_first});
//      session.commit();
//      this.${relation.relationClassField.clazz.name?uncap_first}Business.refresh(new${relation.relationClassField.clazz.name?cap_first});
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