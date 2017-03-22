<#-- @ftlvariable name="clazz" type="br.com.techne.cronos.ide.template.model.Clazz" -->
package ${entityPackage}<#if subPackage??>.${subPackage}</#if>;

import java.io.*;
import javax.persistence.*;
import java.util.*;
import javax.xml.bind.annotation.*;
<#list clazz.imports as import>
import ${import};
</#list>
<#if subPackage??>import ${entityPackage}.*;</#if>
<#list clazz.subPackageToImport as subPackageToImport>
<#if subPackage?? && subPackageToImport != subPackage >
import ${entityPackage}.${subPackageToImport}.*;
</#if>
</#list>
<#if (clazz.multitenantClass)>
import org.eclipse.persistence.annotations.*;
</#if>

/**
* @generated
*/
@Embeddable
public class ${clazz.name + "PK"} implements Serializable {

  /**
  * UID da classe, necessário na serialização
  * @generated
  */
  private static final long serialVersionUID = 1L;
  <#list clazz.primaryKeys as field>
  <#if field.name?contains('_')>
    <#assign name = "${field.name?string[0..field.name?index_of('_') - 1]}">
  <#else>
    <#assign name = "${field.name}">
  </#if>
  
  /**
   * @generated
   */
  <#if field.isDate()>
  @Temporal(TemporalType.DATE)
  <#elseif field.isTime()>
  @Temporal(TemporalType.TIME)
  <#elseif field.isTimestamp()>
  @Temporal(TemporalType.TIMESTAMP)
  </#if>
  @Column(name = "${field.dbFieldName}"<#if field.length??>, length=${field.length?c}</#if><#if field.precision??>, precision=${field.precision?c}</#if><#if field.scale??>, scale=${field.scale?c}</#if>, insertable=${field.insertable?c}, updatable=${field.updatable?c})
  ${field.modifier} <#if field.arrayRelation>${field.type}<#else>${field.type}</#if> ${name}<#if field.defaultValue?has_content> = ${field.defaultValue}</#if>;
  </#list>
  
  /**
   * Construtor
   * @generated
   */
  public ${clazz.name + "PK"}(){
  }
  
  <#list clazz.primaryKeys as field>
  <#if field.name?contains('_')>
    <#assign name = "${field.name?string[0..field.name?index_of('_') - 1]}">
  <#else>
    <#assign name = "${field.name}">
  </#if>
  /**
   * Obtém ${name}
   * 
   * return ${name}
   * @generated
   */
  public ${field.type} get${name?cap_first}(){
    return this.${name};
  }
  
  /**
   * Define ${name}
   * @param ${name} ${name}
   * @generated
   */
  public ${clazz.name + "PK"} set${name?cap_first}(${field.type} ${name}){
    this.${name} = ${name};
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
    ${clazz.name + "PK"} object = (${clazz.name + "PK"})obj;
    <#list clazz.primaryKeys as field>
    if (${name} != null ? !${name}.equals(object.${name}) : object.${name} != null) return false;
    </#list>
    return true;
  }
  
  /**
   * @generated
   */
  @Override
  public int hashCode() {
    int result = 1;
    <#list clazz.primaryKeys as field>
    <#if !field.isTypePrimitive()>
    result = 31 * result + ((${name} == null) ? 0 : ${name}.hashCode());
    </#if>
    </#list>
    return result;
  }

}
