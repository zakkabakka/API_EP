const models = require('../models');
const Schedule = models.Schedule;

module.exports = {
    loginCheck: function (req, res, next) {
        User.findOne({
            where: {
                email: req.body.email
            }
        }).then(function (err, user) {
            if (err) {
                return res.status(500).send(err);
            }
            if (!user) {
                return res.status(404).send("utilisateur non trouvé");
            }
        });
    },
    isAuth: function(req, res, next) {
        if (!req.session.user) {
            return res.status(401).send("Vous devez etre connecté");
        }
        return next();
    },
    isAccompanist: function(req, res, next) {
        if (!req.session.user) {
            return res.status(401).send("Vous devez etre connecté");
        }
        console.log(req.session.user);
        if (req.session.user.role != "accompanist") {
            return res.status(403).send("Vous devez etre accompagnateur");
        }
        return next();
    },
    isStudent: function(req, res, next) {
        if (!req.session.user) {
            return res.status(401).send("Vous devez etre connecté");
        }
        console.log(req.session.user);
        if (req.session.user.role != "student") {
            return res.status(403).send("Vous devez etre eleve");
        }
        return next();
    },
    destroySession: function(req, res, next) {
        req.logOut();
        req.session.destroy();
    }
};