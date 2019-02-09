const express = require('express');
const router = express.Router();
const models = require('../models');
const User = models.User;
const middleware = require('../middlewares/registerRequest');

router.post('/', function(req, res) {
    //console.log(req.body);
    User.create({
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
    }).then(function(CreatedUser){
        res.status(201).send({message: "User successfully created"});
        return
    }, function(error) {
        res.status(400).send({message: "An error occurred"});
        return
    });
});

module.exports = router;
