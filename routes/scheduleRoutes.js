const express = require('express');
const router = express.Router();
const models = require('../models');
const Schedule = models.Schedule;
const User = models.User;
const Appointment = models.Appointment;
const middleware = require('../middlewares/authRequest');


router.post('/add', middleware.isAccompanist, function (req, res) {
    var user = req.session.user;
    var date = req.body.date;
    var startTime = req.body.startTime;
    var endTime = req.body.endTime;

    Schedule.findOne({
        where: {
            UserId: user.id,
            date: date,
            startTime: startTime,
            endTime: endTime
        }
    }).then(function(sc, err){
        if (sc) {
            return res.status(409).send("Date déjà enregistrée");
        } else {
            Schedule.create({
                UserId: user.id,
                date: date,
                startTime: startTime,
                endTime: endTime
            }).then(function(sc, err) {
                if (err) {
                    return res.status(500).send("error:" + err);
                }
                return res.status(200).send("Date enregistrée");
            })
        }
    });
});

router.put('/:id/update', middleware.isAccompanist, function(req, res) {
    var user = req.session.user;
    var schedule = req.params.id;
    var date = req.body.date;
    var startTime = req.body.startTime;
    var endTime = req.body.endTime;

    Schedule.findOne({
        where: {
            UserId: user.id,
            date: date,
            startTime: startTime,
            endTime: endTime
        }
    }).then(function(sc, err) {
        if (sc) {
            return res.status(409).send("Date déjà enregistrée");
        } else {
            Schedule.update({
                date: date,
                startTime: startTime,
                endTime: endTime
            }, {
                where: {
                    id: schedule
                }
            }).then(function (sc, err) {
                if (!sc) {
                    return res.status(500).send("err" + err);
                }
                return res.status(200).send("planning modifié");
            });
        }
    });
});

router.delete('/:id/delete', middleware.isAccompanist, function(req, res) {
    Schedule.destroy({
        where: {
            id: req.params.id
        }
    }).then(function(sc, err) {
        if (err) {
            return res.status(500).send("err" + err);
        }
        if (sc == 0) {
            return res.status(409).send("date non existante");
        }
        return res.status(200).send("Date supprimée");
    });
});

router.post('/:id/rdv/request', middleware.isStudent, function(req, res) {
    Schedule.findOne({
        where: {
            id: req.params.id
        },
        include: {
            model: User
        },
        attributes: ['id', 'date', 'startTime', 'endTime', 'UserId']
    }).then(function(sc, err) {
        if (err) {
            return res.status(500).send("err" + err);
        }
        if (sc != null) {
            Appointment.create({
                accompanist_id: sc.UserId,
                student_id: req.session.user.id,
                date: sc.date,
                start_time: sc.startTime,
                end_time: sc.endTime,
                status: "pending",
                price_final: sc.User.price
            }).then(function(apt, err) {
                if (err) {
                    return res.status(500).send("err" + err);
                }
                return res.status(200).send(apt);
            });
        }
    })
});

module.exports = router;