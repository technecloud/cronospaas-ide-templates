<#if clazz.restPath != "" >
  <#assign request_mapping_value = clazz.restPath + "/" + clazz.name >
<#else>
  <#assign request_mapping_value = restPath + "/" + clazz.name >
</#if>
<#assign class_entity_name = "${clazz.name}">
var model = require("<#list 2..countRestFolderToRoot as i>../</#list>./${entityPackage?replace('.','/')}");

module.exports = function(app){
  
<#list clazz.namedQueries as namedQuery><#assign keys = namedQuery.params?keys> 
  <#assign method_named_query_name = "${namedQuery.name?uncap_first}">
    <#if method_named_query_name != "list">
  /**
   * List with pagination - NamedQuery
   * @generated
   */
  app.get('${request_mapping_value?trim}/${method_named_query_name}', function(req, res){
    
    <#assign replacedParams = "${namedQuery.query?replace('\n\r','')?replace('\r\t','')?replace('\n','')?replace('\t','')}">
    <#list keys as key>
    var ${key} = req.param('${key}');
      <#assign replacedParams = "${replacedParams?replace(':${key}','${key}')}">
    </#list>
    
    model.${class_entity_name}.findAll({
      offset: getAttribute('offset', req),
      limit: getAttribute('limit', req),
      include: [<#list clazz.fields as field><#if field.reverseRelation> { model: model.${field.type} }, </#if></#list>],
      where: ${replacedParams}
    }).then(function(obj) {
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(obj));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });
    </#if>
</#list>
  
  /**
   * Find all obj
   * @generated
   */
  app.get('${request_mapping_value?trim}', function(req, res){
    
    model.${class_entity_name}.findAll({
      offset: getAttribute('offset', req),
      limit: getAttribute('limit', req),
      include: [<#list clazz.fields as field><#if field.reverseRelation> { model: model.${field.type} }, </#if></#list>]
    }).then(function(obj) {
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(obj));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });
  
<#if clazz.hasSearchableField()>
  /**
   * Searchable fields - General search (Only strings fields)
   * @generated
   */
  app.get('${request_mapping_value?trim}/generalSearch', function(req, res){
    
    var search = req.param('search');
    
    model.${class_entity_name}.findAll({ 
      offset: getAttribute('offset', req),
      limit: getAttribute('limit', req),
      include: [<#list clazz.fields as field><#if field.reverseRelation> { model: model.${field.type} }, </#if></#list>],
      <#if clazz.hasSearchableFieldString()>
      where: { $or: [
        <#list clazz.fields as field>
          <#if field.isSearchable() && field.getType()=="STRING" >
                    {${field.name}: {$like: '%'+search+'%'}}, 
          </#if>
        </#list>
                  ]
              } 
      </#if>
    }).then(function(obj) {
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(obj));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });
  
  
  /**
   * Searchable fields - Specific search
   * @generated
   */
  app.get('${request_mapping_value?trim}/specificSearch', function(req, res){
  
    var filter = {};
  <#list clazz.fields as field>
    <#if field.isSearchable() >
      if (req.param('${field.name}'))
      <#if field.isDate() || field.isTimestamp() >  
        filter.${field.name} = getDate(req.param('${field.name}'));
      <#elseif field.isBoolean()>
        filter.${field.name} = req.param('${field.name}')=='true'?1:0;
      <#elseif field.isString()>
        filter.${field.name} = {$like: '%'+req.param('${field.name}')+'%'};
      <#else>
        filter.${field.name} = req.param('${field.name}');
      </#if>
    </#if>
  </#list>    
    
    model.${class_entity_name}.findAll({ 
      offset: getAttribute('offset', req),
      limit: getAttribute('limit', req),
      include: [<#list clazz.fields as field><#if field.reverseRelation> { model: model.${field.type} }, </#if></#list>],
      where: filter
    }).then(function(obj) {
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(obj));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });
</#if>
  
  /**
   * Find by id
   * @generated
   */
  app.get('${request_mapping_value?trim}/<#list clazz.primaryKeys as field>:${field.name}<#if field_has_next>/</#if></#list>', function(req, res){
  
  <#list clazz.primaryKeys as field>
    var ${field.name} = req.param('${field.name}');
  </#list>  
    
    model.${class_entity_name}.findOne({ 
      offset: getAttribute('offset', req),
      limit: getAttribute('limit', req),
      include: [<#list clazz.fields as field><#if field.reverseRelation> { model: model.${field.type} }, </#if></#list>],
      where: { <#list clazz.primaryKeys as field>${field.name}: ${field.name}<#if field_has_next>,</#if></#list> } 
    }).then(function(obj) {
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(obj));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });

  /**
   * Post new obj
   * @generated
   */
  app.post('${request_mapping_value?trim}', function(req, res){
    
    var jsonObj = req.body;
  <#list clazz.fields as field>
    <#if field.reverseRelation> 
    if (jsonObj.${field.type})
      jsonObj.${field.type}${field.clazz.primaryKeys?first.name?cap_first} = jsonObj.${field.type}.${field.clazz.primaryKeys?first.name};
    </#if>
  </#list>
    
    model.${class_entity_name}.create(jsonObj).then(function(obj) {
      model.${class_entity_name}.findOne({ 
        include: [<#list clazz.fields as field><#if field.reverseRelation> { model: model.${field.type} }, </#if></#list>],
        where: { <#list clazz.primaryKeys as field>${field.name}: obj.${field.name}<#if field_has_next>,</#if></#list> }  
      }).then(function(localizedOject) {
        res.writeHead(200, {"Content-Type": "application/json"});
        res.end(JSON.stringify(localizedOject));
      }).catch(function(err) {
        res.writeHead(500, {"Content-Type": "application/json"});
        res.end(JSON.stringify({error: err}));  
      });
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
    
    
  });
  
  /**
   * Update a current obj
   * @generated
   */
  app.put('${request_mapping_value?trim}', function(req, res){
    
    var jsonObj = req.body;
  <#list clazz.fields as field>
    <#if field.reverseRelation> 
    if (jsonObj.${field.type})
      jsonObj.${field.type}${field.clazz.primaryKeys?first.name?cap_first} = jsonObj.${field.type}.${field.clazz.primaryKeys?first.name};
    </#if>
  </#list>
    
    model.${class_entity_name}.update(jsonObj, { where: { <#list clazz.primaryKeys as field>${field.name}: jsonObj.${field.name}<#if field_has_next>,</#if></#list> } }).then(function(obj) {
      model.${class_entity_name}.findOne({ 
        include: [<#list clazz.fields as field><#if field.reverseRelation> { model: model.${field.type} }, </#if></#list>],
        where: { <#list clazz.primaryKeys as field>${field.name}: jsonObj.${field.name}<#if field_has_next>,</#if></#list> }  
      }).then(function(localizedOject) {
        res.writeHead(200, {"Content-Type": "application/json"});
        res.end(JSON.stringify(localizedOject));
      }).catch(function(err) {
        res.writeHead(500, {"Content-Type": "application/json"});
        res.end(JSON.stringify({error: err}));  
      });
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });
  
  /**
   * Update a current obj
   * @generated
   */
  app.put('${request_mapping_value?trim}/<#list clazz.primaryKeys as field>:${field.name}<#if field_has_next>/</#if></#list>', function(req, res){
    
  <#list clazz.primaryKeys as field>
    var ${field.name} = req.param('${field.name}');
  </#list>    
    var jsonObj = req.body;
    <#list clazz.fields as field>
    <#if field.reverseRelation> 
    if (jsonObj.${field.type})
      jsonObj.${field.type}${field.clazz.primaryKeys?first.name?cap_first} = jsonObj.${field.type}.${field.clazz.primaryKeys?first.name};
    </#if>
  </#list>
  
  <#list clazz.primaryKeys as field>
    jsonObj.${field.name} = ${field.name};
  </#list>   
    
    model.${class_entity_name}.update(jsonObj, { where: { <#list clazz.primaryKeys as field>${field.name}: jsonObj.${field.name}<#if field_has_next>,</#if></#list> } }).then(function(obj) {
      model.${class_entity_name}.findOne({ 
        include: [<#list clazz.fields as field><#if field.reverseRelation> { model: model.${field.type} }, </#if></#list>],
        where: { <#list clazz.primaryKeys as field>${field.name}: jsonObj.${field.name}<#if field_has_next>,</#if></#list> }  
      }).then(function(localizedOject) {
        res.writeHead(200, {"Content-Type": "application/json"});
        res.end(JSON.stringify(localizedOject));
      }).catch(function(err) {
        res.writeHead(500, {"Content-Type": "application/json"});
        res.end(JSON.stringify({error: err}));  
      });
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });

  /**
   * Delete a current obj
   * @generated
   */ 
  app.delete('${request_mapping_value?trim}/<#list clazz.primaryKeys as field>:${field.name}<#if field_has_next>/</#if></#list>', function(req, res){
    
  <#list clazz.primaryKeys as field>
    var ${field.name} = req.param('${field.name}');
  </#list>    
    
    model.${class_entity_name}.destroy({ where: { <#list clazz.primaryKeys as field>${field.name}: ${field.name}<#if field_has_next>,</#if></#list> } }).then(function(obj) {
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(obj));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });
  
<#list clazz.oneToManyRelation as relation>
  <#if relation.clazz.hasSearchableField()>
  /**
   * OneToMany Relationship - Searchable fields - General search (Only strings fields)
   * @generated
   */
  app.get('${request_mapping_value?trim}/<#list clazz.primaryKeys as field>:${field.name}<#if field_has_next>/</#if></#list>/${relation.relationName}/generalSearch', function(req, res){
     
    <#list clazz.primaryKeys as field>
    var ${field.name} = req.param('${field.name}');
    </#list>
    var search = req.param('search');
    
    model.${relation.relationName}.findAll({ 
      offset: getAttribute('offset', req),
      limit: getAttribute('limit', req),
      include: [<#list relation.clazz.fields as field><#if field.reverseRelation> { model: model.${field.type} }, </#if></#list>],
      where: {  ${clazz.name}Id: id,
      <#if relation.clazz.hasSearchableFieldString()>
                $or: [
        <#list relation.clazz.fields as field>
          <#if field.isSearchable() && field.getType()=="STRING" >
                    {${field.name}: {$like: '%'+search+'%'}}, 
          </#if>
        </#list>
                    ]
      </#if>
              } 
    }).then(function(obj) {
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(obj));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });
  
  /**
   * OneToMany Relationship - Searchable fields - Specific search
   * @generated
   */
  app.get('${request_mapping_value?trim}/<#list clazz.primaryKeys as field>:${field.name}<#if field_has_next>/</#if></#list>/${relation.relationName}/specificSearch', function(req, res){
  
    var filter = {};
  <#list clazz.primaryKeys as field>
    filter.${clazz.name}Id = req.param('${field.name}');
  </#list>
  <#list relation.clazz.fields as field>
    <#if field.isSearchable() >
    if (req.param('${field.name}'))
      <#if field.isDate() || field.isTimestamp() >  
      filter.${field.name} = getDate(req.param('${field.name}'));
      <#elseif field.isBoolean()>
      filter.${field.name} = req.param('${field.name}')=='true'?1:0;
      <#elseif field.isString()>
      filter.${field.name} = {$like: '%'+req.param('${field.name}')+'%'};
      <#else>
      filter.${field.name} = req.param('${field.name}');
      </#if>
    </#if>
  </#list>    
    
    model.${relation.relationName}.findAll({ 
      offset: getAttribute('offset', req),
      limit: getAttribute('limit', req),
      include: [<#list relation.clazz.fields as field><#if field.reverseRelation> { model: model.${field.type} }, </#if></#list>],
      where: filter
    }).then(function(obj) {
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(obj));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });
  </#if>


  /**
   * OneToMany Relationship GET
   * @generated
   */
  app.get('${request_mapping_value?trim}/<#list clazz.primaryKeys as field>:${field.name}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName}', function(req, res){
    
  <#list clazz.primaryKeys as field>
    var ${field.name} = req.param('${field.name}');
  </#list>  
    
    model.${relation.relationName}.findAll({ 
      include: [<#list relation.clazz.fields as field><#if field.reverseRelation> { model: model.${field.type} }, </#if></#list>],
      where: { ${clazz.name}Id: id } 
    }).then(function(obj) {
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(obj));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });

  /**
   * OneToMany Relationship DELETE 
   * @generated
   */  
  app.delete('${request_mapping_value?trim}/<#list clazz.primaryKeys as field>:${field.name}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName}/:${relation.relationName}Id', function(req, res){
  
    var ${relation.relationName}Id = req.param('${relation.relationName}Id');
    
    model.${relation.relationName}.destroy({ where: { id: ${relation.relationName}Id} }).then(function(obj) {
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(obj));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });
  
  /**
   * OneToMany Relationship PUT
   * @generated
   */  
  app.put('${request_mapping_value?trim}/<#list clazz.primaryKeys as field>:${field.name}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName}/:${relation.relationName}Id', function(req, res){
  
    var ${relation.relationName}Id = req.param('${relation.relationName}Id');
    var jsonObj = req.body;
    
    <#list relation.clazz.fields as field>
    <#if field.reverseRelation> 
    if (jsonObj.${field.type})
      jsonObj.${field.type}${field.clazz.primaryKeys?first.name?cap_first} = jsonObj.${field.type}.${field.clazz.primaryKeys?first.name};
    </#if>
  </#list>
    
    model.${relation.relationName}.update(jsonObj, { where: { id: ${relation.relationName}Id } }).then(function(obj) {
      model.${relation.relationName}.findOne({ 
        include: [<#list relation.clazz.fields as field><#if field.reverseRelation> { model: model.${field.type} }, </#if></#list>],
        where: { id: ${relation.relationName}Id }  
      }).then(function(localizedOject) {
        res.writeHead(200, {"Content-Type": "application/json"});
        res.end(JSON.stringify(localizedOject));
      }).catch(function(err) {
        res.writeHead(500, {"Content-Type": "application/json"});
        res.end(JSON.stringify({error: err}));  
      });
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });  
  
  /**
   * OneToMany Relationship POST
   * @generated
   */  
  app.post('${request_mapping_value?trim}/<#list clazz.primaryKeys as field>:${field.name}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName}', function(req, res){
    
    var jsonObj = req.body;
  <#list clazz.primaryKeys as field>
    var ${field.name} = req.param('${field.name}');
  </#list>  
    jsonObj.${clazz.name}Id = ${clazz.primaryKeys?first.name};
  <#list relation.clazz.fields as field>
    <#if field.reverseRelation> 
    if (jsonObj.${field.type})
      jsonObj.${field.type}${field.clazz.primaryKeys?first.name?cap_first} = jsonObj.${field.type}.${field.clazz.primaryKeys?first.name};
    </#if>
  </#list>
    
    model.${relation.relationName}.create(jsonObj).then(function(obj) {
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(obj));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });  
  
</#list>  
  
<#list clazz.manyToManyRelation as relation>
  <#if relation.relationClassField.clazz.hasSearchableField()>
  /**
   * ManyToMany Relationship - Searchable fields - General search (Only strings fields)
   * @generated
   */
  app.get('${request_mapping_value?trim}/<#list clazz.primaryKeys as field>:${field.name}<#if field_has_next>/</#if></#list>/${relation.relationName}/generalSearch', function(req, res){
     
    <#list clazz.primaryKeys as field>
    var ${field.name} = req.param('${field.name}');
    </#list>
    var search = req.param('search');
    
    model.${relation.relationClassField.clazz.name}.findAll({ 
      offset: getAttribute('offset', req),
      limit: getAttribute('limit', req),
      include: [<#list relation.relationClassField.clazz.fields as field><#if field.reverseRelation> { model: model.${field.type} }, </#if></#list>],
      where: {  ${clazz.name}Id: id,
      <#if relation.relationClassField.clazz.hasSearchableFieldString()>
                $or: [
        <#list relation.relationClassField.clazz.fields as field>
          <#if field.isSearchable() && field.getType()=="STRING" >
                    {${field.name}: {$like: '%'+search+'%'}}, 
          </#if>
        </#list>
                    ]
      </#if>
              } 
    }).then(function(obj) {
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(obj));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });
  
  /**
   * ManyToMany Relationship - Searchable fields - Specific search
   * @generated
   */
  app.get('${request_mapping_value?trim}/<#list clazz.primaryKeys as field>:${field.name}<#if field_has_next>/</#if></#list>/${relation.relationName}/specificSearch', function(req, res){
  
    var filter = {};
  <#list clazz.primaryKeys as field>
    filter.${relation.relationClassField.clazz.name}Id = req.param('${field.name}');
  </#list>
  <#list relation.relationClassField.clazz.fields as field>
    <#if field.isSearchable() >
    if (req.param('${field.name}'))
      <#if field.isDate() || field.isTimestamp() >  
      filter.${field.name} = getDate(req.param('${field.name}'));
      <#elseif field.isBoolean()>
      filter.${field.name} = req.param('${field.name}')=='true'?1:0;
      <#elseif field.isString()>
      filter.${field.name} = {$like: '%'+req.param('${field.name}')+'%'};
      <#else>
      filter.${field.name} = req.param('${field.name}');
      </#if>
    </#if>
  </#list>    
    
    model.${relation.relationClassField.clazz.name}.findAll({ 
      offset: getAttribute('offset', req),
      limit: getAttribute('limit', req),
      include: [<#list relation.relationClassField.clazz.fields as field><#if field.reverseRelation> { model: model.${field.type} }, </#if></#list>],
      where: filter
    }).then(function(obj) {
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(obj));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });
  </#if>

  /**
   * ManyToMany Relationship GET
   * @generated
   */
  app.get('${request_mapping_value?trim}/<#list clazz.primaryKeys as field>:${field.name}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName}', function(req, res){
  
  <#list clazz.primaryKeys as field>
    var ${field.name} = req.param('${field.name}');
  </#list>  
    
    model.${relation.relationClassField.clazz.name}.findAll({ 
      include: [<#list relation.relationClassField.clazz.fields as field><#if field.reverseRelation> { model: model.${field.type} }, </#if></#list>],
      where: { ${relation.associativeClassField.name}Id: id } 
    }).then(function(obj) {
      var ${relation.relationName}s = [];
      obj.forEach(function(currObj) { ${relation.relationName}s.push(currObj.${relation.relationName});});
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(${relation.relationName}s));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });

  /**
   * ManyToMany Relationship POST
   * @generated
   */  
  app.post('${request_mapping_value?trim}/<#list clazz.primaryKeys as field>:${field.name}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName}', function(req, res){
    
  <#list clazz.primaryKeys as field>
    var ${field.name} = req.param('${field.name}');
  </#list> 
    var ${relation.relationClassField.clazz.name} = {};
    ${relation.relationClassField.clazz.name}.${relation.associativeClassField.name}Id = id;
    ${relation.relationClassField.clazz.name}.${relation.relationName}Id = req.body.${relation.relationClassField.clazz.primaryKeys?first.name};
    
    model.${relation.relationClassField.clazz.name}.create(${relation.relationClassField.clazz.name}).then(function(obj) {
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(obj));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });
  
  /**
   * ManyToMany Relationship DELETE
   * @generated
   */  
  app.delete('${request_mapping_value?trim}/<#list clazz.primaryKeys as field>:${field.name}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName}/:${relation.relationName}Id', function(req, res){
  
  <#list clazz.primaryKeys as field>
    var ${field.name} = req.param('${field.name}');
  </#list> 
    var ${relation.relationName}Id = req.param('${relation.relationName}Id');
    
    model.${relation.relationClassField.clazz.name}.destroy({ where: { ${relation.associativeClassField.name}Id: id, ${relation.relationName}Id: ${relation.relationName}Id} }).then(function(obj) {
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(obj));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });
</#list> 
};

var getAttribute = function(attribute ,req) {
  var page = req.param('page') != null ? parseInt(req.param('page')) : 0;
  var limit = req.param('size') != null ? parseInt(req.param('size')) : 100;
  var offset = page * limit;
  
  if (attribute === 'offset')
    return offset;
  else if (attribute === 'limit') 
    return limit;
};

<#if clazz.hasSearchableFieldDate()>
var getDate = function(st) {
  var pattern = /(\d{2})\/(\d{2})\/(\d{4})/;
  var result = st.replace(pattern,'$3-$2-$1');
  if (result.length == 10)
    result+='T03:00:00.000Z';
  return result;
};
</#if>
