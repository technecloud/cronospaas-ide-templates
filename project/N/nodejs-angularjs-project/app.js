/**
 * 
 */
var http = require("http");
var express = require('express');
var app = express();


//expected -> http://local/run/QueryParam
app.get('/run/:id', function(req, res){
  var id = req.param('id');
  res.writeHead(200, {"Content-Type": "text/html"});  
  res.end("Action received param: " + id);
});


var server = app.listen(process.env.VCAP_APP_PORT || 8888, function () {
  console.log('Started');
});

