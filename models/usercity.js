'use strict';
module.exports = (sequelize, DataTypes) => {
  var UserCity = sequelize.define('UserCity', {
    accompanist_id: DataTypes.INTEGER,
    city_id: DataTypes.INTEGER
  }, {
    classMethods: {
      associate: function(models) {
        models.Quality.belongsTo(models.User);
        models.Quality.belongsTo(models.City);
      }
    }
  });
  return UserCity;
};