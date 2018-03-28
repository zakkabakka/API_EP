'use strict';
module.exports = (sequelize, DataTypes) => {
  var StudentNote = sequelize.define('StudentNote', {
    appointment_id: DataTypes.INTEGER,
    times: DataTypes.INTEGER,
    km: DataTypes.INTEGER,
    road_type: DataTypes.STRING,
    circumstance: DataTypes.STRING,
    observation: DataTypes.STRING
  }, {
    classMethods: {
      associate: function(models) {
        models.StudentNote.belongsTo(models.User)
      }
    }
  });
  return StudentNote;
};