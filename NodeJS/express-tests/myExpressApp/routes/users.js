var express = require('express');
var router = express.Router();

/* GET users listing. */
router
  .get('/', function(req, res, next) {
    res.send('respond with a resource');
  })
  .get('/list', function (req, res, next) {
    res.render('user-list');
  });

module.exports = router;
