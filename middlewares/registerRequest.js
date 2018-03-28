const models = require('../models');
const User = models.User;

module.exports = {
    registerCheck: function(req, res, next) {
        User.findOne({
            where: {
                email: req.body.email
            }
        }).then(function(user) {
           if (user != null) {
               return res.status(409).send("Email already exist");
           }
        });
        if (!req.body.firstname || !req.body.lastname || !req.body.email || !req.body.password || !req.body.role) {
            return (res.status(400).send("Veuillez remplir tous les champs"));
        }
        return next();
    }
};