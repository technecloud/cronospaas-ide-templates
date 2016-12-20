/**
 * 
 */
var serverPort = process.env.VCAP_APP_PORT || 8888;
var fs = require('fs');
var express = require('express');
var bodyParser = require('body-parser');

var app = express();
app.use(bodyParser());
app.use(express.static('./public'));

require('./app/sync_models');
require('./app/rest_loader')(app);

app.get('/run/:id', function(req, res){
  var id = req.params('id');
  res.writeHead(200, {"Content-Type": "text/html"});  
  res.end("Action received param: " + id);
});

var server = app.listen(serverPort, function () {
  console.log('Started');
});