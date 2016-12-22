/**
 * 
 */
var serverPort = process.env.VCAP_APP_PORT || 8888;
var fs = require('fs');
var express = require('express');
var bodyParser = require('body-parser');
var jwt    = require('jsonwebtoken');

var app = express();

app.set('superSecret', 'nodejsauth');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(express.static('./public'));

//Authenticate user
var apiRoutes = express.Router(); 
apiRoutes.use(function(req, res, next) {
  var token = req.body.token || req.query.token || req.headers['x-auth-token'];
  if (token) {
    jwt.verify(token, app.get('superSecret'), function(err, decoded) {      
      if (err) {
        return res.json({ success: false, message: 'Failed to authenticate token.' });    
      } else {
        req.decoded = decoded;    
        next();
      }
    });
  } else {
    return res.status(403).send({ 
        success: false, 
        message: 'No token provided.' 
    });
  }
});
app.use('/api', apiRoutes);

require('./app/sync_models');
require('./app/rest_loader')(app);

var server = app.listen(serverPort, function () {
  console.log('Started');
});

