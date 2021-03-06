package ${entityPackage};

import java.io.*;
import javax.persistence.*;
import java.util.*;
import javax.xml.bind.annotation.*;
<#list clazz.imports as import>
import ${import};
</#list>
<#if (clazz.multitenantClass)>
import org.eclipse.persistence.annotations.*;
</#if>

/**
 * Classe que representa a tabela <#if tableName??>${tableName}<#else>${clazz.name?upper_case}</#if>
 * @generated
 */
@Entity
@Table(name = "\"<#if tableName??><#if persistenceProvider == "oracle">${tableName?upper_case}<#else>${tableName}</#if><#else>${clazz.name?upper_case}</#if>\""<#if schemeName??>, schema="\"<#if persistenceProvider == "oracle">${schemeName?upper_case}<#else>${schemeName}</#if>\"" </#if>)
@NamedQueries({
  <#list clazz.namedQueries as namedQuery>@NamedQuery(name = "${clazz.name?uncap_first}${namedQuery.name?cap_first}", query = "${namedQuery.query?replace('(\n)+', ' ','r')}")<#if namedQuery_has_next>,</#if></#list>
})
@XmlRootElement
<#if (clazz.multitenantClass)>
@Multitenant(MultitenantType.SINGLE_TABLE)
<#if (clazz.multitententFields?size > 1)>
@TenantDiscriminatorColumns({
</#if>
<#list clazz.multitententFields as field>
@TenantDiscriminatorColumn(name = "${field.dbFieldName}", contextProperty = "${field.multitenantContext}")<#if field_has_next>,</#if>
</#list>
</#if>
public class ${clazz.name} implements Serializable {

  /**
   * UID da classe, necessário na serialização 
   * @generated
   */
  private static final long serialVersionUID = 1L;
  <#list clazz.fields as field>
  <#if field.primaryKey>
  
  /**
   * @generated
   */
  @Id
  <#if field.generationType?? && field.generationType == "Identity">
  <#if persistenceProvider == "mysql">
  @GeneratedValue(strategy = GenerationType.AUTO)
  <#else>
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  </#if>
  </#if>
  ${field.modifier} <#if field.arrayRelation>${field.type}<#else>${field.type}</#if> ${field.name}<#if field.defaultValue?has_content> = ${field.defaultValue}<#elseif field.primaryKey && field.generationType?? && field.generationType == "UUID"> = UUID.randomUUID().toString().toUpperCase()</#if>;
  <#else>
  
  /**
  * @generated
  */
  <#if field.relation>
  @OneToOne
  <#elseif field.reverseRelation>
  @ManyToOne
  </#if>
  <#if (field.relationNames?size == 1)>
  <#list field.relationNames?keys as key>
  <#if key??>
  @JoinColumn(name="${key}", referencedColumnName = "${field.relationNames[key]}", insertable=${field.insertable?c}, updatable=${field.updatable?c})
  </#if>
  </#list>
  <#elseif (field.relationNames?size > 1)>
  <#assign i= field.relationNames?size>
  @JoinColumns({
  <#list field.relationNames?keys as key>
  <#if key??>
  @JoinColumn(name="${key}", referencedColumnName = "${field.relationNames[key]}", insertable=${field.insertable?c}, updatable=${field.updatable?c})
  <#if (i>1)>,
  </#if>
  </#if>
  <#assign i = i-1>
  </#list>
  })
  <#elseif field.arrayRelation>
  @OneToMany(fetch = FetchType.LAZY, mappedBy="${field.mappedBy}", insertable=${field.insertable?c}, updatable=${field.updatable?c})
  <#else>
  <#if field.transient>
  @Transient
  <#else>
  <#if field.isDate()>
  @Temporal(TemporalType.DATE)
  <#elseif field.isTime()>
  @Temporal(TemporalType.TIME)
  <#elseif field.isTimestamp()>
  @Temporal(TemporalType.TIMESTAMP)
  </#if>
  @Column(name = "${field.dbFieldName}"<#if !field.primaryKey>, nullable = ${field.nullable?c}, unique = ${field.unique?c}</#if><#if field.length??>, length=${field.length?c}</#if><#if field.precision??>, precision=${field.precision?c}</#if><#if field.scale??>, scale=${field.scale?c}</#if>, insertable=${field.insertable?c}, updatable=${field.updatable?c})
  </#if>
  </#if>
  <#if (field.ignore)>
  @JsonIgnore
  </#if>
  ${field.modifier} <#if field.arrayRelation>${field.type}<#else>${field.type}</#if> ${field.name}<#if field.defaultValue?has_content> = ${field.defaultValue}</#if>;
  </#if>
  </#list>

	/**
	 * Construtor
	 * @generated
	 */
	public ${clazz.name}(){
	}

  <#list clazz.fields as field>
  /**
   * Obtém ${field.name}
   * 
   * return ${field.name}
   * @generated
   */
  public ${field.type} get${field.name?cap_first}(){
    return this.${field.name};
  }
  
  /**
   * Define ${field.name}
   * @param ${field.name} ${field.name}
   * @generated
   */
  public ${clazz.name} set${field.name?cap_first}(${field.type} ${field.name}){
    this.${field.name} = ${field.name};
    return this;
  }
  
  </#list>
  /**
   * @generated
   */ 
  @Override
  public boolean equals(Object obj) {
    if (this == obj) return true;
    if (obj == null || getClass() != obj.getClass()) return false;
    ${clazz.name} object = (${clazz.name})obj;
    <#list clazz.fields as field>
    <#if field.primaryKey>
    if (${field.name} != null ? !${field.name}.equals(object.${field.name}) : object.${field.name} != null) return false;
    </#if>
    </#list>
    return true;
  }
  
  /**
   * @generated
   */
  @Override
  public int hashCode() {
    int result = 1;
    <#list clazz.fields as field>
    <#if field.primaryKey && !field.isTypePrimitive()>
    result = 31 * result + ((${field.name} == null) ? 0 : ${field.name}.hashCode());
    </#if>
    </#list>
    return result;
  }

}