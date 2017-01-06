"use strict";

module.exports = function(sequelize, DataTypes) {  
  var userrole = sequelize.define('userrole', {
    id: {
      type: DataTypes.STRING,
      defaultValue: DataTypes.UUIDV1,
      primaryKey: true
    },
  }, 
  {
    classMethods: {
      associate: function(models) {
        userrole.belongsTo(models.user);
        userrole.belongsTo(models.role);
      }
    },
    freezeTableName: true
  });
  return userrole;
};