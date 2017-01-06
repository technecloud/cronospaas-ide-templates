"use strict";

module.exports = function(sequelize, DataTypes) {  
  var user = sequelize.define('user', {
    id: {
      type: DataTypes.STRING,
      defaultValue: DataTypes.UUIDV1,
      primaryKey: true
    },
    email: DataTypes.STRING,
    name: DataTypes.STRING,
    login: DataTypes.STRING,
    picture: DataTypes.STRING,
    theme: DataTypes.STRING,
    password: DataTypes.STRING,
  }, 
  {
    classMethods: {
      associate: function(models) {
        user.belongsToMany(models.role, { through: models.userrole });
      }
    },
    freezeTableName: true
  });
  return user;
};