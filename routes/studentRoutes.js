const express = require('express');
const router = express.Router();
const models = require('../models');
const User = models.User;
const Schedule = models.Schedule;
const Appointment = models.Appointment;
const middleware = require('../middlewares/authRequest');
var wget = require('node-wget');
var stringify = require('json-stringify');

router.put('/me/update', middleware.isStudent, function(req,res) {
    var user = req.session.user;
    User.update({
        where: {
            id: user.id
        }
    }).then(function (user, err) {
        if (err) {
            return res.status(500).send("Error: " + err);
        }
        return res.status(200).send("modification reussie");
    })
});

router.get('/find/accompanist', middleware.isStudent, function(req,res) {
    User.findAndCountAll({
        where: {
            role: "accompanist"
        }
    }).then(function (user, err){
        if (err) {
            return res.status(500).send("Error");
        }
        var array = [];
        var i = 0;
        (user.rows).forEach(function(val){
            wget({
                    url:  'http://api.zippopotam.us/fr/' + val.city
                },
                function (error, response, body) {
                    i++;
                    if (error) {
                        console.log('--- error:');
                        console.log(error);            // error encountered
                    } else {
                        var data = JSON.parse(body).places[0];

                        var obj = {
                            id: val.id,
                            price: val.price,
                            latitude: data.latitude,
                            longitude: data.longitude
                        };
                        array.push(obj);
                        if (i == user.rows.length) {
                            return res.status(200).send(array);
                        }
                    }
                }
            );
        });
    });
});

router.get('/my/course', middleware.isStudent, function(req, res) {
    var user = req.session.user;

    Appointment.findAndCountAll({
        where: {
            student_id: user.id
        }
    }).then(function(apt, err) {
        if (err) {
            res.status(500).send("error");
        }
        if (apt) {
            res.status(200).send(apt.rows);
        }
    });
});

router.get('/my/course/:status', middleware.isStudent, function(req, res) {
    var user = req.session.user;

    Appointment.findAndCountAll({
       where: {
           student_id: user.id,
           status: req.params.status
       }
    }).then(function(apt, err) {
        if (err) {
            res.status(500).send("error");
        }
        if (apt) {
            res.status(200).send(apt.rows);
        }
    });
});

router.get('/:id/infos', middleware.isAccompanist, function(req, res) {
    User.find({
        where: {
            id: req.params.id
        }
    }).then(function(user, err) {
        if (err) {
            return res.status(500).send("error");
        }
        if (user) {
            return res.status(200).send(user);
        }
    })
});

module.exports = router;