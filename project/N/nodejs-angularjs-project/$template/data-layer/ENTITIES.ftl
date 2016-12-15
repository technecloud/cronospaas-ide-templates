"use strict";

module.exports = function(sequelize, DataTypes) {  
  return sequelize.define('<#if tableName??>${tableName?lower_case}<#else>${clazz.name?lower_case}'</#if>, {
<#list clazz.fields as field>
  <#if field.primaryKey>
	  ${field.name}: {
	    type: ${field.type},
    <#if field.generationType?? && field.generationType == "Identity">
      <#if persistenceProvider == "mysql">
      defaultValue: DataTypes.UUIDV1,
      </#if>
    </#if>
	    primaryKey: true
	  },
	<#else>
	  ${field.name}: ${field.type},
	</#if>
</#list>
  }, 
  {
    freezeTableName: true
  });
};