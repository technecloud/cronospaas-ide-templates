package ${daoPackage}<#if subPackage??>.${subPackage}</#if>;

import ${entityPackage}.*;
<#if subPackage??>
import ${entityPackage}.${subPackage}.*;
</#if>
<#list clazz.subPackageToImport as subPackageToImport>
  <#if subPackage?? && subPackageToImport != subPackage >
import ${entityPackage}.${subPackageToImport}.*;
  </#if>
</#list> 
import java.util.*;
import org.springframework.stereotype.*;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.domain.*;
import org.springframework.data.repository.query.*;
import org.springframework.transaction.annotation.*;
<#assign field_pk_type = "String">
<#list clazz.fields as field>
  <#if clazz.hasCompositeKey()>
    <#assign field_pk_type = "${clazz.name + 'PK'}">
  <#elseif field.primaryKey && !field.typePrimitive>
    <#assign field_pk_type = "${field.type}">
  </#if>
</#list>

<#assign persistence_unit_name = "String">
<#if cronapWizardNamespace?? >
  <#assign persistence_unit_name = "${cronapWizardNamespace}">
<#else>
  <#assign persistence_unit_name = workspaceView.getActiveEditor().getDiagram().getGlobalAttribute("namespace")?replace('"','')>
</#if>

/**
 * Realiza operação de Create, Read, Update e Delete no banco de dados.
 * Os métodos de create, edit, delete e outros estão abstraídos no JpaRepository
 * 
 * @see org.springframework.data.jpa.repository.JpaRepository
 * 
 * @generated
 */
@Repository("${clazz.name}DAO")
@Transactional(transactionManager="${persistence_unit_name}-TransactionManager")
public interface ${clazz.name}DAO extends JpaRepository<${clazz.name}, ${field_pk_type}> {

}
