const express = require('express');
const session = require('express-session');
const mysql   = require("mysql");
const bodyParser  = require("body-parser");
const http = require('http');
const router = express.Router();
const models = require('./models');

const app = express();
const PORT = 3000;

const registerRoutes = require(__dirname + '/routes/registerRoutes');
const qualityRoutes = require(__dirname + '/routes/qualityRoutes');
const loginRoutes = require(__dirname + '/routes/loginRoutes');
const logoutRoutes = require(__dirname + '/routes/logoutRoutes');
const accompanistRoutes = require(__dirname + '/routes/accompanistRoutes');
const studentRoutes = require(__dirname + '/routes/studentRoutes');
const scheduleRoutes = require(__dirname + '/routes/scheduleRoutes');
const appointmentRoutes = require(__dirname + '/routes/appointmentRoutes');


models.sequelize.sync().then(function () {
  app.listen(PORT, function () {
    console.log('Server is Running on http://localhost:' + PORT);
  });
});
 //app.use(express.cookieParser());
app.use(bodyParser.json()); // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true }));

app.use(function(req, res, next) {
  res.setHeader('Access-Control-Allow-Origin', 'http://localhost:3000');
  res.setHeader('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
  res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type');
  res.setHeader('Access-Control-Allow-Credentials', true);
  next();
});

var sessionStore = new session.MemoryStore();

/**
 * Declare all the middlewares
 */

app.use(session({secret:"qpjfc3o9032_nk-fds", resave:false, saveUninitialized:true, cookie: {maxAge:86400000} }));

app.use('/login', loginRoutes);
app.use('/accompanist', accompanistRoutes);
app.use('/student', studentRoutes);
app.use('/accompanist/schedule', scheduleRoutes);
app.use('/appointment', appointmentRoutes);
app.use('/logout', logoutRoutes);
app.use('/register', registerRoutes);
app.use('/quality', qualityRoutes);
app.use('/user', qualityRoutes);

