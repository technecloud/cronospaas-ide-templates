"use strict";

module.exports = function(sequelize, DataTypes) {  
  var ${clazz.name} = sequelize.define('${clazz.name}', {
<#list clazz.fields as field>
  <#if field.primaryKey>
    ${field.name}: {
      type: DataTypes.${field.type}<#if field.getLength()??>(${field.getLength()})</#if>,
    <#if field.generationType?? && field.generationType == "UUID">
      defaultValue: DataTypes.UUIDV1,
    <#elseif field.generationType?? && field.generationType == "Identity">
      autoIncrement: true,
    </#if>
    <#if (field.isUnique())>
      unique: true,
    </#if>
      primaryKey: true,
      allowNull: ${field.isNullable()?c}
    },
  <#else>
    <#if (!field.relation && !field.reverseRelation)>
    ${field.name}: {
      type: DataTypes.${field.type}<#if field.getLength()??>(${field.getLength()})</#if>,
      <#if (field.isUnique())>
      unique: true,
      </#if>
      allowNull: ${field.isNullable()?c}
    },
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
  <#list clazz.manyToManyRelation as relation>
        ${clazz.name}.belongsToMany(models.${relation.relationName}, { through: models.${relation.relationClassField.clazz.name} });
  </#list>
      }
    },
    freezeTableName: true
  });
  return ${clazz.name};
};