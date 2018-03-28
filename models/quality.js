'use strict';
module.exports = (sequelize, DataTypes) => {
  var Quality = sequelize.define('Quality', {
    user_id: DataTypes.INTEGER,
    name: DataTypes.STRING
  }, {
    classMethods: {
      associate: function(models) {
        // associations can be defined here
        models.Quality.belongsTo(models.User, {
          foreignKey: {
            allowNull: false
          }
        })
      }
    }
  });
  return Quality;
};