package ${restPackage};

import org.springframework.data.domain.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.*;


import org.springframework.http.ResponseEntity;
import org.springframework.beans.factory.annotation.*;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.*;

import ${entityPackage}.*;
import ${bussinessPackage}.*;

<#assign class_name = "${clazz.name}REST">
<#assign class_entity_name = "${clazz.name}">
<#assign class_business_name = "${clazz.name}Business">
<#assign class_business_variable_name = "${clazz.name?uncap_first}Business">
<#assign request_mapping_value = restPath + "/" + clazz.name >


@RestController
@RequestMapping(value = "${request_mapping_value}")
public class ${class_name} {


    @Autowired
    @Qualifier("${class_business_name}")
    private ${class_business_name} ${class_business_variable_name};

    // CRUD
    @RequestMapping(method = RequestMethod.POST)
    public ${class_entity_name} post(@Validated @RequestBody final ${class_entity_name} entity) throws Exception {
        ${class_business_variable_name}.getRepository().save(entity);
        return entity;
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<${class_entity_name}> get(@RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset) throws Exception {
        Page<${class_entity_name}> pages = ${class_business_variable_name}.getRepository().findAll(new PageRequest(offset, limit));
        return pages.getContent();
    }

    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public ResponseEntity<?> get(@PathVariable("id") final String id) throws Exception {
        ${class_entity_name} entity = ${class_business_variable_name}.getRepository().findOne(id);
        return entity == null ? ResponseEntity.status(404).build() : ResponseEntity.ok(entity);
    }

    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity<?> put(@Validated @RequestBody final ${class_entity_name} entity) throws Exception {
        return ResponseEntity.ok( ${class_business_variable_name}.getRepository().saveAndFlush(entity));
    }

    @RequestMapping(method = RequestMethod.PUT, value = "/{id}")
    public ${class_entity_name} put(@PathVariable("id") final String id, @Validated @RequestBody final ${class_entity_name} entity) throws Exception {
        return ${class_business_variable_name}.getRepository().saveAndFlush(entity);
    }

    @RequestMapping(method = RequestMethod.DELETE)
    public void delete(@Validated @RequestBody final ${class_entity_name} entity) throws Exception {
         ${class_business_variable_name}.getRepository().delete(entity);
    }

    @RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
    public void delete(@PathVariable("id") final String id) throws Exception {
         ${class_business_variable_name}.getRepository().delete(id);
    }

// NamedQueries
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

}