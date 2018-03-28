const express = require('express');
const router = express.Router();
const models = require('../models');
const middleware = require('../middlewares/authRequest');
const Appointment = models.Appointment;

router.get('/:id', middleware.isAuth, function(req,res) {
   Appointment.find({
       where: {
           id: req.params.id
       }
   }).then(function(apt, err) {
       if (err) {
           return res.status(500).send("error");
       }
       if (apt) {
           return res.status(200).send(apt);
       }
   })
});

router.put('/:id/status/change', middleware.isAuth, function(req, res) {
    Appointment.update({
            status: req.body.status,
            cancelation_reasons: req.body.cancelation_reasons
        }, {
        where: {
            id: req.params.id,
            status: "pending"
        }
    }).then(function(apt, err) {
        if (err) {
            res.status(500).send("error");
        }
        if (apt) {
            res.status(200).send("statut modifie");
        }
    });
});

module.exports = router;