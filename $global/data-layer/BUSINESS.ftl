package ${bussinessPackage};

import ${daoPackage}.*;
import ${entityPackage}.*;
<#if daoPackage != sessionManagerPackage>
import ${sessionManagerPackage}.*;
</#if>

import java.util.*;

/**
 * Classe que representa a camada de negócios de ${clazz.name}
 * @generated
 **/
public class ${clazz.name}Business {

  /**
   * Instância da classe ${clazz.name}DAO que faz o acesso ao banco de dados
   * @generated
   */
  private ${clazz.name}DAO dao;
  
  /**
   * Singleton de sessão usado para abrir e fechar conexão com o banco de dados
   * @generated
   */
  protected SessionManager sessionManager;
	
  /**
   * Copia referência da sessão e instancia DAO relacionada à essa classe para manipular o banco de dados
   * 
   * @param sessionmanager
   *          Singleton de sessão
   * @generated modifiable
   */
  public ${clazz.name}Business(final SessionManager sessionmanager) {
    // begin-user-code
    // end-user-code
    this.sessionManager = sessionmanager;
    this.dao = new ${clazz.name}DAO(sessionmanager.getEntityManager());
    // begin-user-code
    // end-user-code
  }
  
  /**
   * Construtor padrão, inicializa singleton de sessão
   * @generated modifiable   
   */
  public ${clazz.name}Business() {
    // begin-user-code
    // end-user-code  
    this(SessionManager.getInstance());
    // begin-user-code
    // end-user-code    
  }	

  /**
   * Grava valor no banco
   * 
   * @param entity Linha da tabela a ser persistida no banco de dados
   * @generated modifiable   
   */
  public void save(final ${clazz.name} entity) {
    // begin-user-code
    // end-user-code  
    dao.save(entity);
    // begin-user-code
    // end-user-code    
  }
  
  /**
   * Dá um refresh na entidade com valores valor no banco
   * 
   * @param entity Entidade
   * @generated modifiable
   */
  public void refresh(final ${clazz.name} entity) {
    // begin-user-code
    // end-user-code  
    dao.refresh(entity);
    // begin-user-code
    // end-user-code  
  }  
  
  /**
   * Atualiza valor do banco
   * 
   * @param entity Linha da tabela a ser atualizada
   * @generated modifiable   
   */
  public ${clazz.name} update(final ${clazz.name} entity) {
    // begin-user-code
    // end-user-code  
	  ${clazz.name} updatedEntity = dao.update(entity);
    // begin-user-code
    // end-user-code	
    return updatedEntity;
  }
  
  /**
   * Apaga valor do banco
   * 
   * @param entity Linha da tabela a ser excluída
   * @generated modifiable   
   */
  public void delete(final ${clazz.name} entity){
    // begin-user-code
    // end-user-code    
	  dao.delete(entity);
    // begin-user-code
    // end-user-code  	
  }
  
  /**
   * Remove a instância de ${clazz.name} utilizando os identificadores
   * 
   <#list clazz.primaryKeys as field>
   * @param ${field.name}
   *          Identificador 
   </#list>
   * @return Quantidade de modificações efetuadas
   * @generated modifiable   
   */  
  public int deleteById(<#list clazz.primaryKeys as field>${field.type} ${field.name}<#if field_has_next>, </#if></#list>){
    // begin-user-code
    // end-user-code  
    int result = dao.deleteById(<#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list>);
    // begin-user-code
    // end-user-code    
    return result;    
  }  
  
  /**
   * Obtém a instância de ${clazz.name} utilizando os identificadores
   * 
   <#list clazz.primaryKeys as field>
   * @param ${field.name}
   *          Identificador 
   </#list>
   * @return Instância relacionada com o filtro indicado
   * @generated modifiable
   */  
  public ${clazz.name} findById(<#list clazz.primaryKeys as field>${field.type} ${field.name}<#if field_has_next>, </#if></#list>){
    // begin-user-code
    // end-user-code  
    ${clazz.name} entity = dao.findById(<#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list>);
    // begin-user-code
    // end-user-code      
    return entity;  
  }   
  
<#list clazz.oneToManyRelation as relation>
  /**
   * @generated modifiable
   */  
  public List<${relation.clazz.name}> find${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>${field.type} ${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>int limit, int offset) {
      // begin-user-code
      // end-user-code  
      List<${relation.clazz.name}> result = dao.find${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>limit, offset);
      // begin-user-code  
      // end-user-code        
      return result;	  
  }

</#list>

<#list clazz.manyToManyRelation as relation>
  /**
   * @generated modifiable
   */  
  public List<${relation.relationClassField.type}> list${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>${field.type} ${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>int limit, int offset) {
      // begin-user-code
      // end-user-code  
      List<${relation.relationClassField.type}> result = dao.list${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>limit, offset);
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
      int result = dao.delete${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if><#list relation.relationClass.primaryKeys as field>relation${field.name?cap_first}<#if field_has_next>, </#if></#list>);
      // begin-user-code
      // end-user-code  
      return result;  
  }
    
</#list>
  
	<#list clazz.namedQueries as namedQuery><#assign keys = namedQuery.params?keys>	
  /**
   * @generated modifiable
   */  	
  public <#if !namedQuery.void>List<${clazz.name}><#else>int</#if> ${namedQuery.name}(<#list keys as key>${namedQuery.params[key]} ${key}<#if key_has_next>, </#if></#list><#if !namedQuery.void><#if keys?size gt 0>, </#if>int limit, int offset</#if>){
      // begin-user-code
      // end-user-code  
      <#if !namedQuery.void>List<${clazz.name}><#else>int</#if> result = dao.${namedQuery.name}(<#list keys as key>${key}<#if key_has_next>, </#if></#list><#if !namedQuery.void><#if keys?size gt 0>, </#if>limit, offset</#if>);
      // begin-user-code
      // end-user-code        
      return result;	
  }  
	</#list>
}
