'use strict';
module.exports = (sequelize, DataTypes) => {
  var City = sequelize.define('City', {
    lat: DataTypes.DECIMAL,
    long: DataTypes.DECIMAL,
    city: DataTypes.STRING
  }, {
    classMethods: {
      associate: function(models) {
        // associations can be defined here
        models.User.hasMany(models.UserCity);
      }
    }
  });
  return City;
};