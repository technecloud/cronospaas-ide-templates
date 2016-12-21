"use strict";

module.exports = function(sequelize, DataTypes) {  
  var ${clazz.name} = sequelize.define('${clazz.name}', {
<#list clazz.fields as field>
  <#if field.primaryKey>
    ${field.name}: {
      type: DataTypes.${field.type},
    <#if field.generationType?? && field.generationType == "UUID">
      defaultValue: DataTypes.UUIDV1,
    <#elseif field.generationType?? && field.generationType == "Identity">
      autoIncrement: true,
    </#if>
      primaryKey: true
    },
  <#else>
    <#if (!field.relation && !field.reverseRelation)>
    ${field.name}: DataTypes.${field.type},
    </#if>
  </#if>
</#list>
  }, 
  {
    classMethods: {
      associate: function(models) {
  <#list clazz.fields as field>
    <#if field.reverseRelation>      
        ${clazz.name}.belongsTo(models.${field.type});
    </#if>
  </#list>
      }
    },
    freezeTableName: true
  });
  return ${clazz.name};
};