'use strict';
module.exports = (sequelize, DataTypes) => {
  var AccompanistNote = sequelize.define('AccompanistNote', {
    note: DataTypes.INTEGER,
    comment: DataTypes.STRING
  }, {
    classMethods: {
      associate: function(models) {
        // associations can be defined here
        models.Quality.belongsTo(models.User)
      }
    }
  });
  return AccompanistNote;
};