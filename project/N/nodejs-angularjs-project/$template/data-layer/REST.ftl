<#if clazz.restPath != "" >
  <#assign request_mapping_value = clazz.restPath + "/" + clazz.name >
<#else>
  <#assign request_mapping_value = restPath + "/" + clazz.name >
</#if>
<#assign class_entity_name = "${clazz.name}">
var model = require(".././models");

module.exports = function(app){
  
  /**
   * Find all obj
   */
  app.get('${request_mapping_value?trim}', function(req, res){
    
    model.${class_entity_name}.findAll().then(function(obj) {
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
    
    model.${class_entity_name}.findOne({ where: { <#list clazz.primaryKeys as field>${field.name}: ${field.name}<#if field_has_next>,</#if></#list> } }).then(function(obj) {
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
};
