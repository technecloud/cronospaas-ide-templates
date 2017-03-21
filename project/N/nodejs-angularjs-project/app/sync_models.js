var modelsToSync = ['./main/models'];

modelsToSync.forEach(function(model) { 
  var m = require(model);
  m.sequelize.sync();
});