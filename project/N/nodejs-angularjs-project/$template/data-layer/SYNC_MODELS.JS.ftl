var modelsToSync = [<#list  workspaceView.allDiagrams as diagram>'./${diagram.getGlobalAttribute("entityPackage")?replace('"','')?replace('.','/')}'<#if diagram_has_next>,</#if></#list>];

modelsToSync.forEach(function(model) { 
  var m = require(model);
  m.sequelize.sync();
});