package ${bussinessPackage};

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.data.domain.*;


import ${daoPackage}.*;
import ${entityPackage}.*;
import java.util.*;


<#assign persistence_unit_name = workspaceView.getActiveEditor().getDiagram().getGlobalAttribute("namespace")?replace('"','')>

<#assign qualified_repository_name = "${clazz.name}DAO">
<#assign clazz_name = "${clazz.name}Business">


@Service("${clazz_name}")
@Transactional(transactionManager="${persistence_unit_name}-TransactionManager")
public class ${clazz_name} {

    @Autowired
    @Qualifier("${qualified_repository_name}")
    protected ${clazz.name}DAO repository;

    public ${clazz.name}DAO getRepository() {
        return repository;
    }

<#list clazz.oneToManyRelation as relation>
  /**
   * @generated modifiable
   */  
  public List<${relation.clazz.name}> find${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>${field.type} ${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if> Pageable pageable) {
      // begin-user-code
      // end-user-code  
      List<${relation.clazz.name}> result = repository.find${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if> pageable );
      // begin-user-code  
      // end-user-code        
      return result;	  
  }

</#list>


<#list clazz.manyToManyRelation as relation>
  /**
   * @generated modifiable
   */  
  public List<${relation.relationClassField.type}> list${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>${field.type} ${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if> Pageable pageable ) {
      // begin-user-code
      // end-user-code  
      List<${relation.relationClassField.type}> result = repository.list${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if> pageable );
      // begin-user-code
      // end-user-code
      return result;        	  
  }
  
  /**
   * @generated modifiable
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
