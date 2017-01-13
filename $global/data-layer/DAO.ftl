package ${daoPackage};

import javax.persistence.*;
import ${entityPackage}.*;
import java.util.*;
import java.io.Serializable;

/**
 * Realiza operação de Create, Read, Update e Delete no banco de dados.
 * @generated
 */
public class ${clazz.name}DAO extends BasicDAO<String, ${clazz.name}> implements Serializable {

	/**
	 * UID da classe, necessário na serialização 
	 * @generated
	 */
	private static final long serialVersionUID = 1L;

  /**
   * Guarda uma cópia da EntityManager na instância
   * 
   * @param entitymanager
   *          Tabela do banco
   * @generated
   */
  public ${clazz.name}DAO(EntityManager entitymanager) {
    super(entitymanager);
  }
  
<#list clazz.fields as field> 
  <#if (field.relation)>
  /**
   * Obtém a instância de ${clazz.name} utilizando ${field.type}W como critério de filtro
   * 
   * @param ${field.name}
   *          Relacionamento 
   * @return Instância relacionada com o filtro indicado
   * @generated
   */  
  public ${clazz.name} findBy${field.name?cap_first}(${field.type} ${field.name}){
      return this.entityManager.createQuery("SELECT entity FROM ${clazz.name} entity WHERE entity.${field.name} = :${field.name}", ${clazz.name}.class)
            .setParameter("${field.name}", ${field.name}).getSingleResult();	
  }
  
  <#elseif (field.reverseRelation)>
</#if>
</#list>
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
  public int deleteById(<#list clazz.primaryKeys as field>${field.type} ${field.name}<#if field_has_next>, </#if></#list>){
      Query query = this.entityManager.createQuery("DELETE FROM ${clazz.name} entity WHERE <#list clazz.primaryKeys as field>entity.${field.pathName} = :${field.name}<#if field_has_next> AND </#if></#list>");
      <#list clazz.primaryKeys as field>
      query.setParameter("${field.name}", ${field.name});
      </#list>
      return query.executeUpdate();	
  }
  
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
  public ${clazz.name} findById(<#list clazz.primaryKeys as field>${field.type} ${field.name}<#if field_has_next>, </#if></#list>){
      TypedQuery<${clazz.name}> query = this.entityManager.createQuery("SELECT entity FROM ${clazz.name} entity WHERE <#list clazz.primaryKeys as field>entity.${field.pathName} = :${field.name}<#if field_has_next> AND </#if></#list>", ${clazz.name}.class);
      <#list clazz.primaryKeys as field>
      query.setParameter("${field.name}", ${field.name});
      </#list>
      return query.getSingleResult();	
  }

<#list clazz.oneToManyRelation as relation>
  /**
   * OneToMany Relation
   * @generated
   */
  public List<${relation.clazz.name}> find${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>${field.type} ${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>int limit, int offset) {
      TypedQuery<${relation.clazz.name}> query = this.entityManager.createQuery("SELECT entity FROM ${relation.clazz.name} entity WHERE <#list clazz.primaryKeys as field>entity.${relation.relationField.pathName}.${field.name} = :${field.name}<#if field_has_next> AND </#if></#list>", ${relation.clazz.name}.class);
      <#list clazz.primaryKeys as field>
      query.setParameter("${field.name}", ${field.name});
      </#list>
      return query.setFirstResult(offset).setMaxResults(limit).getResultList();	  
  }
  
</#list>
<#list clazz.manyToManyRelation as relation>
  /**
   * ManyToOne Relation
   * @generated
   */
  public List<${relation.relationClassField.type}> list${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>${field.type} ${field.name}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>int limit, int offset) {
      TypedQuery<${relation.relationClassField.type}> query = this.entityManager.createQuery("SELECT entity.${relation.relationClassField.name} FROM ${relation.associativeClassField.clazz.name} entity WHERE <#list clazz.primaryKeys as field>entity.${relation.associativeClassField.name}.${field.pathName} = :${field.name}<#if field_has_next> AND </#if></#list>", ${relation.relationClassField.type}.class);
      <#list clazz.primaryKeys as field>
      query.setParameter("${field.name}", ${field.name});
      </#list>
      return query.setFirstResult(offset).setMaxResults(limit).getResultList();	  
  }

  /**
   * ManyToOne Relation Delete
   * @generated
   */
  public int delete${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if><#list relation.relationClass.primaryKeys as field>${field.type} relation${field.name?cap_first}<#if field_has_next>, </#if></#list>) {
    Query query = this.entityManager.createQuery("DELETE FROM ${relation.associativeClassField.clazz.name} entity WHERE <#list clazz.primaryKeys as field>entity.${relation.associativeClassField.name}.${field.pathName} = :instance${field.name?cap_first}<#if field_has_next> AND </#if></#list><#if clazz.primaryKeys?size gt 0> AND </#if><#list relation.relationClass.primaryKeys as field>entity.${relation.relationClassField.pathName}.${field.pathName} = :relation${field.name?cap_first}<#if field_has_next> AND </#if></#list>");
    <#list clazz.primaryKeys as field>
    query.setParameter("instance${field.name?cap_first}", instance${field.name?cap_first});
    </#list>
    <#list relation.relationClass.primaryKeys as field>
    query.setParameter("relation${field.name?cap_first}", relation${field.name?cap_first});
    </#list>
    return query.executeUpdate();	  
  }
  
</#list>
<#list clazz.namedQueries as namedQuery><#assign keys = namedQuery.params?keys>	
  /**
   * NamedQuery ${namedQuery.name}
   * @generated
   */
  public <#if !namedQuery.void>List<${clazz.name}><#else>int</#if> ${namedQuery.name}(<#list keys as key>${namedQuery.params[key]} ${key}<#if key_has_next>, </#if></#list><#if !namedQuery.void><#if keys?size gt 0>, </#if>int limit, int offset</#if>){
    return this.entityManager.createNamedQuery("${clazz.name?uncap_first}${namedQuery.name?cap_first}", ${clazz.name}.class)<#list keys as key>.setParameter("${key}", ${key})</#list><#if !namedQuery.void>.setFirstResult(offset).setMaxResults(limit).getResultList()<#else>.executeUpdate()</#if>;		
  }
  
</#list>
}