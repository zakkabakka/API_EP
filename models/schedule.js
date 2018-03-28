'use strict';
module.exports = (sequelize, DataTypes) => {
  var Schedule = sequelize.define('Schedule', {
    UserId: DataTypes.INTEGER,
    date: DataTypes.DATEONLY,
    startTime: DataTypes.TIME,
    endTime: DataTypes.TIME
  }, {
    classMethods: {
      associate: function(models) {
        Schedule.belongsTo(models.User, {
          foreignKey: 'UserId'
        })
      }
    }
  });
  return Schedule;
};
