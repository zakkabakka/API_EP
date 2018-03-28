'use strict';

module.exports = (sequelize, DataTypes) => {
  var User = sequelize.define('User', {
    firstname: DataTypes.STRING,
    lastname: DataTypes.STRING,
    email: DataTypes.STRING,
    password: DataTypes.STRING,
    driving_hours: DataTypes.STRING,
    licence_date: DataTypes.DATEONLY,
    diploma: DataTypes.BOOLEAN,
    years_experience: DataTypes.INTEGER,
    price: DataTypes.DECIMAL,
    role: DataTypes.STRING,
    phone: DataTypes.INTEGER,
    city: DataTypes.STRING
  }, {
    classMethods: {
      associate: function(models) {
        // associations can be defined here
        models.User.hasMany(models.Quality);
        models.User.hasMany(models.Schedule);
      }
    }
  });

  return User;

};