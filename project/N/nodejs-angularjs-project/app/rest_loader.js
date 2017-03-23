var rests = ['./main/rest'];

var fs = require('fs');
var path      = require("path");
var requireDir = function (path_rest, param) {
  if (path_rest.indexOf('/')!==path_rest.length-1) {
    path_rest+='/';
  }
  path_rest = path.join(__dirname, path_rest);
  
  fs.readdirSync(path_rest).forEach(function(file) {
    require(path_rest + file)(param);
  });
};

module.exports = function(app) {
  rests.forEach(function(rest) { 
    requireDir(rest, app);
  });
};

