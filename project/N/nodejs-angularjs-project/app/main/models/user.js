"use strict";

module.exports = function(sequelize, DataTypes) {  
  var user = sequelize.define('user', {
    id: {
      type: DataTypes.STRING,
      defaultValue: DataTypes.UUIDV1,
      primaryKey: true,
      allowNull: false
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    login: {
      type: DataTypes.STRING,
      allowNull: false
    },
    picture: {
      type: DataTypes.STRING,
      allowNull: false
    },
    theme: {
      type: DataTypes.STRING,
      allowNull: false
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false
    },
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