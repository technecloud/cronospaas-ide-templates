var model = require("../.././main/models");

module.exports = function(app){
  
  
  /**
   * Find all obj
   * @generated
   */
  app.get('/api/security/role', function(req, res){
    
    model.role.findAll({
      offset: getAttribute('offset', req),
      limit: getAttribute('limit', req),
      include: []
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
  app.get('/api/security/role/:id', function(req, res){
  
    var id = req.param('id');
    
    model.role.findOne({ 
      offset: getAttribute('offset', req),
      limit: getAttribute('limit', req),
      include: [],
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
  app.post('/api/security/role', function(req, res){
    
    var jsonObj = req.body;
    
    model.role.create(jsonObj).then(function(obj) {
      model.role.findOne({ 
        include: [],
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
  app.put('/api/security/role', function(req, res){
    
    var jsonObj = req.body;
    
    model.role.update(jsonObj, { where: { id: jsonObj.id } }).then(function(obj) {
      model.role.findOne({ 
        include: [],
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
  app.put('/api/security/role/:id', function(req, res){
    
    var id = req.param('id');
    var jsonObj = req.body;
  
    jsonObj.id = id;
    
    model.role.update(jsonObj, { where: { id: jsonObj.id } }).then(function(obj) {
      model.role.findOne({ 
        include: [],
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
  app.delete('/api/security/role/:id', function(req, res){
    
    var id = req.param('id');
    
    model.role.destroy({ where: { id: id } }).then(function(obj) {
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(obj));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });
  


  /**
   * OneToMany Relationship GET
   * @generated
   */
  app.get('/api/security/role/:id/userrole', function(req, res){
    
    var id = req.param('id');
    
    model.userrole.findAll({ 
      include: [ { model: model.user },  { model: model.role }, ],
      where: { roleId: id } 
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
  app.delete('/api/security/role/:id/userrole/:userroleId', function(req, res){
  
    var userroleId = req.param('userroleId');
    
    model.userrole.destroy({ where: { id: userroleId} }).then(function(obj) {
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
  app.put('/api/security/role/:id/userrole/:userroleId', function(req, res){
  
    var userroleId = req.param('userroleId');
    var jsonObj = req.body;
    
    if (jsonObj.user)
      jsonObj.userId = jsonObj.user.id;
    if (jsonObj.role)
      jsonObj.roleId = jsonObj.role.id;
    
    model.userrole.update(jsonObj, { where: { id: userroleId } }).then(function(obj) {
      model.userrole.findOne({ 
        include: [ { model: model.user },  { model: model.role }, ],
        where: { id: userroleId }  
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
  app.post('/api/security/role/:id/userrole', function(req, res){
    
    var jsonObj = req.body;
    var id = req.param('id');
    jsonObj.roleId = id;
    if (jsonObj.user)
      jsonObj.userId = jsonObj.user.id;
    if (jsonObj.role)
      jsonObj.roleId = jsonObj.role.id;
    
    model.userrole.create(jsonObj).then(function(obj) {
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(obj));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });  
  
  

  /**
   * ManyToMany Relationship GET
   * @generated
   */
  app.get('/api/security/role/:id/user', function(req, res){
  
    var id = req.param('id');
    
    model.userrole.findAll({ 
      include: [ { model: model.user },  { model: model.role }, ],
      where: { roleId: id } 
    }).then(function(obj) {
      var users = [];
      obj.forEach(function(currObj) { users.push(currObj.user);});
      res.writeHead(200, {"Content-Type": "application/json"});
      res.end(JSON.stringify(users));
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });
  });

  /**
   * ManyToMany Relationship POST
   * @generated
   */  
  app.post('/api/security/role/:id/user', function(req, res){
    
    var id = req.param('id');
    var userrole = {};
    userrole.roleId = id;
    userrole.userId = req.body.id;
    
    model.userrole.create(userrole).then(function(obj) {
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
  app.delete('/api/security/role/:id/user/:userId', function(req, res){
  
    var id = req.param('id');
    var userId = req.param('userId');
    
    model.userrole.destroy({ where: { roleId: id, userId: userId} }).then(function(obj) {
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

