const express = require('express');
const router = express.Router();

router.post('/', function(req, res) {
    req.session.destroy(function(err) {
        if (err) {
            return res.status(500).send(err);
        }
        return res.status(200).send("Vous etes deconnecte");
    });
});

module.exports = router;
