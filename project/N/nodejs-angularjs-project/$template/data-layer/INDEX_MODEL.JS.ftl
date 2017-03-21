"use strict";

var fs        = require("fs");
var path      = require("path");
var Sequelize = require("sequelize");
var config_database = require('<#list 1..countEntitiesFolderToRoot as i>../</#list>./config/database.js');
var db        = {};

var currentDatabase = config_database.${dataSourceName};

var sequelize = new Sequelize(currentDatabase.database, currentDatabase.username, currentDatabase.password, 
{
  host: currentDatabase.host,
  dialect: currentDatabase.type,
  port: currentDatabase.port,
  storage: currentDatabase.database
});


fs
  .readdirSync(__dirname)
  .filter(function(file) {
    return (file.indexOf(".") !== 0) && (file !== "index.js");
  })
  .forEach(function(file) {
    var model = sequelize.import(path.join(__dirname, file));
    db[model.name] = model;
  });
  
Object.keys(db).forEach(function(modelName) {
  if ("associate" in db[modelName]) {
    db[modelName].associate(db);
  }
});

db.sequelize = sequelize;
db.Sequelize = Sequelize;

module.exports = db;