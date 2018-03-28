const express = require('express');
const router = express.Router();
const models = require('../models');
const Quality = models.Quality;
const middleware = require('../middlewares/authRequest');

router.post('/', function(req, res) {
    // models.sequelize
    //     .authenticate()
    //     .then(function(err) {
    //         res.send(err + 'Connection has been established successfully.');
    //     })
    //     .catch(function (err) {
    //         console.log('Unable to connect to the database:', err);
    //     });
    console.log(Object.keys(models.Quality.rawAttributes));
    console.log("quality routes");
    // if (typeof req.session.user != 'undefined') {
        Quality.create({
            user_id: 1,
            // UserId: 2,
            name: "test2"
        }).then(function(ok, err) {
            res.send("done");
        })
    // }/
});

module.exports = router;
