package ${bussinessPackage};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;


import ${daoPackage}.*;
import ${entityPackage}.*;

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
        String encryption${field.name?cap_first} = new org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder()
            .encode(form${field.name?cap_first});
        entity.set${field.name?cap_first}(encryption${field.name?cap_first});      
        </#if>
      </#list>  
        repository.save(entity);
      // begin-user-code  
      // end-user-code  
      return entity;
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
        String encryption${field.name?cap_first} = form${field.name?cap_first}.startsWith("$2a$10$") ? form${field.name?cap_first} 
            : new org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder().encode(form${field.name?cap_first});
        entity.set${field.name?cap_first}(encryption${field.name?cap_first});      
        </#if>
      </#list>  

        repository.saveAndFlush(entity);
      // begin-user-code  
      // end-user-code        
      return entity;
    }

    /**
     * Serviço exposto para remover a entidade de acordo com o id fornecido
     * 
     * @generated
     */
    public void delete(<#list clazz.primaryKeys as field> ${field.type} ${field.name}<#if field_has_next>, </#if></#list>) throws Exception {
      // begin-user-code  
      // end-user-code        
      repository.delete(<#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list>);
      // begin-user-code  
      // end-user-code        
    }

    // CRUD
    
<#list clazz.namedQueries as namedQuery><#assign keys = namedQuery.params?keys> 

<#assign method_named_query_name = "${namedQuery.name?uncap_first}">
  /**
   * Lista com paginação de acordo com a NamedQuery
   * 
   * @generated
   */
  public <#if !namedQuery.void>Page<${clazz.name}><#else>int</#if> ${method_named_query_name} (<#list keys as key> ${namedQuery.params[key]} ${key}<#if key_has_next>, </#if></#list> <#if !namedQuery.void><#if keys?size gt 0>, </#if>Pageable pageable </#if>){
    // begin-user-code  
    // end-user-code        
    <#if !namedQuery.void>Page<${clazz.name}><#else>int</#if> result = repository.${method_named_query_name} (<#list keys as key> ${key}<#if key_has_next>, </#if></#list> <#if !namedQuery.void><#if keys?size gt 0>, </#if> pageable </#if>);
    // begin-user-code  
    // end-user-code        
    return result;
  }
</#list>
    
    

<#list clazz.oneToManyRelation as relation>
  /**
   * @generated modifiable
   * OneToMany Relation
   */  
  public Page<${relation.clazz.name}> find${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>${field.type} ${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if> Pageable pageable) {
      // begin-user-code
      // end-user-code  
      Page<${relation.clazz.name}> result = repository.find${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if> pageable );
      // begin-user-code  
      // end-user-code        
      return result;    
  }

</#list>


<#list clazz.manyToManyRelation as relation>
  /**
   * @generated modifiable
   * ManyToMany Relation
   */  
  public Page<${relation.relationClassField.type}> list${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>${field.type} ${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if> Pageable pageable ) {
      // begin-user-code
      // end-user-code  
      Page<${relation.relationClassField.type}> result = repository.list${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if> pageable );
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
}