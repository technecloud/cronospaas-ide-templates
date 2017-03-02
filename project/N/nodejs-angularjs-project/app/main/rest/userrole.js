var model = require("../.././main/models");

module.exports = function(app){
  
  
  /**
   * Find all obj
   * @generated
   */
  app.get('/api/security/userrole', function(req, res){
    
    model.userrole.findAll({
      offset: getAttribute('offset', req),
      limit: getAttribute('limit', req),
      include: [ { model: model.user },  { model: model.role }, ]
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
   * @generated
   */
  app.get('/api/security/userrole/:id', function(req, res){
  
    var id = req.param('id');
    
    model.userrole.findOne({ 
      offset: getAttribute('offset', req),
      limit: getAttribute('limit', req),
      include: [ { model: model.user },  { model: model.role }, ],
      where: { id: id } 
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
  app.post('/api/security/userrole', function(req, res){
    
    var jsonObj = req.body;
    if (jsonObj.user)
      jsonObj.userId = jsonObj.user.id;
    if (jsonObj.role)
      jsonObj.roleId = jsonObj.role.id;
    
    model.userrole.create(jsonObj).then(function(obj) {
      model.userrole.findOne({ 
        include: [ { model: model.user },  { model: model.role }, ],
        where: { id: obj.id }  
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
  app.put('/api/security/userrole', function(req, res){
    
    var jsonObj = req.body;
    if (jsonObj.user)
      jsonObj.userId = jsonObj.user.id;
    if (jsonObj.role)
      jsonObj.roleId = jsonObj.role.id;
    
    model.userrole.update(jsonObj, { where: { id: jsonObj.id } }).then(function(obj) {
      model.userrole.findOne({ 
        include: [ { model: model.user },  { model: model.role }, ],
        where: { id: jsonObj.id }  
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
  app.put('/api/security/userrole/:id', function(req, res){
    
    var id = req.param('id');
    var jsonObj = req.body;
    if (jsonObj.user)
      jsonObj.userId = jsonObj.user.id;
    if (jsonObj.role)
      jsonObj.roleId = jsonObj.role.id;
  
    jsonObj.id = id;
    
    model.userrole.update(jsonObj, { where: { id: jsonObj.id } }).then(function(obj) {
      model.userrole.findOne({ 
        include: [ { model: model.user },  { model: model.role }, ],
        where: { id: jsonObj.id }  
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
  app.delete('/api/security/userrole/:id', function(req, res){
    
    var id = req.param('id');
    
    model.userrole.destroy({ where: { id: id } }).then(function(obj) {
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(obj));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });
  
  
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

