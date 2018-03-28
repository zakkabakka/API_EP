'use strict';
module.exports = (sequelize, DataTypes) => {
  var Appointment = sequelize.define('Appointment', {
    accompanist_id: DataTypes.INTEGER,
    student_id: DataTypes.INTEGER,
    date: DataTypes.DATE,
    start_time: DataTypes.TIME,
    end_time: DataTypes.TIME,
    status: DataTypes.STRING,
    cancelation_reasons: DataTypes.STRING,
    price_final: DataTypes.STRING
  }, {
    classMethods: {
      associate: function(models) {
        models.Quality.belongsTo(models.User, {
          as: 'accompanistId',
          foreignKey: 'accompanist_id'
        });
        models.Quality.belongsTo(models.User, {
          as: 'studentId',
          foreignKey: 'student_id'
        })
      }
    }
  });
  return Appointment;
};