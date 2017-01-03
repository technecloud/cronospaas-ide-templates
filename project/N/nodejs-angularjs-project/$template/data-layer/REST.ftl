<#if clazz.restPath != "" >
  <#assign request_mapping_value = clazz.restPath + "/" + clazz.name >
<#else>
  <#assign request_mapping_value = restPath + "/" + clazz.name >
</#if>
<#assign class_entity_name = "${clazz.name}">
var model = require("<#list 2..countRestFolderToRoot as i>../</#list>./${entityPackage?replace('.','/')}");

module.exports = function(app){
  
  /**
   * Find all obj
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
  
  
  /**
   * Find by id
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
   */
  app.post('${request_mapping_value?trim}', function(req, res){
    
    var jsonObj = req.body;
    
  <#list clazz.fields as field>
    <#if field.reverseRelation> 
    if (jsonObj.${field.type})
      jsonObj.${field.type}${field.reverseRelation.clazz?first.name} = jsonObj.${field.type}.${field.reverseRelation.clazz?first.name};
    </#if>
  </#list>
    
    
    model.${class_entity_name}.create(jsonObj).then(function(obj) {
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(obj));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });
  
  /**
   * Update a current obj
   */
  app.put('${request_mapping_value?trim}', function(req, res){
    
    var jsonObj = req.body;
    
    model.${class_entity_name}.update(jsonObj, { where: { <#list clazz.primaryKeys as field>${field.name}: jsonObj.${field.name}<#if field_has_next>,</#if></#list> } }).then(function(obj) {
      model.${class_entity_name}.findOne({ 
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
   */
  app.put('${request_mapping_value?trim}/<#list clazz.primaryKeys as field>:${field.name}<#if field_has_next>/</#if></#list>', function(req, res){
    
  <#list clazz.primaryKeys as field>
    var ${field.name} = req.param('${field.name}');
  </#list>    
    var jsonObj = req.body;
  
  <#list clazz.primaryKeys as field>
    jsonObj.${field.name} = ${field.name};
  </#list>   
    
    model.${class_entity_name}.update(jsonObj, { where: { <#list clazz.primaryKeys as field>${field.name}: jsonObj.${field.name}<#if field_has_next>,</#if></#list> } }).then(function(obj) {
      model.${class_entity_name}.findOne({ 
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
