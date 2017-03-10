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
  <#list clazz.fields as field>
  <#if field.primaryKey>
  
  /**
   * @generated
   */
  @Column(name = "${field.dbFieldName}"<#if field.length??>, length=${field.length?c}</#if><#if field.precision??>, precision=${field.precision?c}</#if><#if field.scale??>, scale=${field.scale?c}</#if>, insertable=${field.insertable?c}, updatable=${field.updatable?c})
  ${field.modifier} <#if field.arrayRelation>${field.type}<#else>${field.type}</#if> ${field.name}<#if field.defaultValue?has_content> = ${field.defaultValue}</#if>;
  </#if>
  </#list>
  
  /**
   * Construtor
   * @generated
   */
  public ${clazz.name + "PK"}(){
  }
  
  <#list clazz.fields as field>
  <#if field.primaryKey>
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
  public ${clazz.name + "PK"} set${field.name?cap_first}(${field.type} ${field.name}){
    this.${field.name} = ${field.name};
    return this;
  }
  </#if>
  </#list>
  
  /**
   * @generated
   */
  @Override
  public boolean equals(Object obj) {
    if (this == obj) return true;
    if (obj == null || getClass() != obj.getClass()) return false;
    ${clazz.name + "PK"} object = (${clazz.name + "PK"})obj;
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
