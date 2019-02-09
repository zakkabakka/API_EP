const express = require('express');
const router = express.Router();
const models = require('../models');
const Schedule = models.Schedule;
const User = models.User;
const middleware = require('../middlewares/authRequest');
const Appointment = models.Appointment;



router.get('/all/accompanist', function(req, res) {
    var user = req.session.user;

    User.findAndCountAll({
        where: {
            role: "accompanist"
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

// ///////////////////////////

router.put('/me/update', middleware.isAccompanist, function(req,res) {
    var user = req.session.user;
    User.update({
            firstname: req.body.firstname,
            lastname: req.body.lastname,
            email: req.body.email,
            password: req.body.password,
            role: req.body.role,
            driving_hours: req.body.driving_hour,
            licence_date: req.body.licence_date,
            diploma: req.body.diploma,
            years_experience: req.body.years_experience,
            price: req.body.price,
            phone: req.body.phone,
            city: req.body.city
        }, {
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


router.get('/', middleware.isAccompanist, function (req, res) {
    var user = req.session.user;
    Schedule.sync().then(function(){
        Schedule.findAndCountAll({
            where: {
                UserId: user.id
            },
            order: ['date'],
            include: {
                model: User
            },
            attributes: ['id', 'date', 'startTime', 'endTime']
        }).then(function (sc, err) {
            var array = [];
            var scObj = [];
            var date = sc.rows[0].date;
            (sc.rows).forEach(function(val) {
                var obj = {
                    id: val.id,
                    date: val.date,
                    startTime: val.startTime,
                    endTime: val.endTime
                };
                array.push(obj);

            });
            if (err) {
                return res.status(500).send("Error: " + err);
            }
            return res.status(200).send(sc.rows);
        })
    });
});

router.get('/:id/schedule', function (req, res) {
    Schedule.sync().then(function(){
        Schedule.findAndCountAll({
            where: {
                UserId: req.params.id
            },
            order: ['date'],
            include: {
                model: User
            },
            attributes: ['id', 'date', 'startTime', 'endTime']
        }).then(function (sc, err) {
            var array = [];
            (sc.rows).forEach(function(val) {
                var date = new Date(val.date);
                date = date.getDate()+"/"+date.getMonth()+"/"+date.getFullYear();
                
                var obj = {
                    id: val.id,
                    text: date+" "+val.startTime+" "+val.endTime
                };
                array.push(obj);

            });
            if (err) {
                return res.status(500).send("Error: " + err);
            }
            return res.status(200).send(sc.rows);
        })
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

router.get('/my/course/:status', middleware.isAccompanist, function(req, res) {
    var user = req.session.user;

    Appointment.findAndCountAll({
        where: {
            accompanist_id: user.id,
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


router.get('/:id/infos', middleware.isStudent, function(req, res) {
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

