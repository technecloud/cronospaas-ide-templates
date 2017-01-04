"use strict";

module.exports = function(sequelize, DataTypes) {  
  var role = sequelize.define('role', {
	  id: {
	    type: DataTypes.STRING,
      defaultValue: DataTypes.UUIDV1,
	    primaryKey: true
	  },
	  name: DataTypes.STRING,
  }, 
  {
    classMethods: {
      associate: function(models) {
      }
    },
    freezeTableName: true
  });
  return role;
};