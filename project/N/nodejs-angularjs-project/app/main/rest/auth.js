var model = require("../.././main/models");
var jwt   = require('jsonwebtoken');

module.exports = function(app){
  /**
   * Authenticate user
   */
  app.post('/auth', function(req, res) {
    
    var username = req.body.username;
    var password = req.body.password;
    
    model.user.findOne({ 
      where: { login: username } 
    }).then(function(user) {
      var result = null;
      //TODO: Cript password
      if (user != null && user.password == password) {
        
        model.userrole.findAll({ 
          include: [ { model: model.role }, ],
          where: { userId: user.id } 
        }).then(function(userrole) {
          
          
          var lightUser = { id: user.id, email: user.email, name: user.name, login: user.login, picture: user.login, theme: user.theme, createdAt: user.createdAt, updatedAt: user.updatedAt, password: user.password }; 
          var token = jwt.sign(lightUser, app.get('superSecret'), {
            expiresIn : 60*60*24 // expires in 24 hours
          });
          
          var roles = '';
          userrole.forEach(function(obj) { roles += obj.role.name + ', '; });
          roles = roles.substring(0, roles.length -2);
          
          var root = roles.indexOf('Administrator')>-1;
          
          result = { user: user,  token: token, expires: 1440000, roles: roles, root: root };
          res.json(result);
            
        }).catch(function (err) {
          res.writeHead(500, {"Content-Type": "application/json"});
          res.end(JSON.stringify({error: err}));
        });
      }
      else {
        res.writeHead(401, {"Content-Type": "application/json"});
        result = { status:401, error: "Unauthorized", exception:"User not authenticate", message:"Access Denied", path:"/auth"};
        res.end(JSON.stringify(result));
      }
      
    }).catch(function (err) {
      res.writeHead(500, {"Content-Type": "application/json"});
      res.end(JSON.stringify({error: err}));
    });  
  });  
  
  
  app.get('/auth/refresh', function(req, res) {
    var token = req.body.token || req.query.token || req.headers['x-auth-token'];
    if (token) {
      jwt.verify(token, app.get('superSecret'), function(err, user) {      
        if (err) {
          return res.json({ success: false, message: 'Failed to refresh token.' });    
        } else {
          
          var lightUser = { id: user.id, email: user.email, name: user.name, login: user.login, picture: user.login, theme: user.theme, createdAt: user.createdAt, updatedAt: user.updatedAt, password: user.password }; 
          var token = jwt.sign(lightUser, app.get('superSecret'), {
            expiresIn : 60*60*24 // expires in 24 hours
          });
          
          result = { token: token, expires: 1440000  };
          res.json(result);
        }
      });
    } else {
      return res.status(403).send({ 
          success: false, 
          message: 'No token provided.' 
      });
    }
  }); 
  
};
