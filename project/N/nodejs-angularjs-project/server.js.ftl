/**
 * 
 */
var serverPort = process.env.VCAP_APP_PORT || 8888;
var fs = require('fs');
var express = require('express');
var bodyParser = require('body-parser');
<#if (authentication??)  && (authentication?lower_case) != "nenhuma" >
var jwt    = require('jsonwebtoken');
</#if>

var app = express();

<#if (authentication??)  && (authentication?lower_case) != "nenhuma" >
app.set('superSecret', 'nodejsauth');
</#if>
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(express.static('./public'));


<#if (authentication??)  && (authentication?lower_case) != "nenhuma" >
//token
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
</#if>
<#if (backend??)  && (backend?lower_case) == "true" >
require('./app/sync_models');
require('./app/rest_loader')(app);
</#if>
var server = app.listen(serverPort, function () {
  console.log('Started');
});

