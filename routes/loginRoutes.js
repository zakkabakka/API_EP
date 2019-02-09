const express = require('express');
const router = express.Router();
const session = require('express-session');
const models = require('../models');
const User = models.User;
const middleware = require('../middlewares/authRequest');

router.post('/', function(req, res) {

    var email = req.body.email;
    var password = req.body.password;

    User.findOne({
        where: {
            email: email,
            password: password
        }
    }).then(function (user, err) {
     
        if (user == null) {
            return res.status(404).send("utilisateur non trouvé");
        }
        if (err) {
            return res.status(500).send("Error:" + err);
        }
        req.session.user = user;
        var sessionUser = req.session.user.dataValues;
        
        return res.status(200).send(user);
    });
});


router.get('/me', middleware.isAuth, function (req, res) {
    
    //console.log("************** JE SUIS CONNECTER ***************");
    
    var user = req.session.user;

    User.find({
        where: {
            id: user.id
        }
    }).then(function (user, err) {
        if (err) {
            return res.status(500).send("Error: " + err);
        }
        //console.log("---------JAI BIEN RECUPER LE USER DEPUIS API-----------", user.id);
        return res.status(200).send(user);
    });
    
});

module.exports = router;













