var express = require('express');

module.exports = function () {
    'use strict';

    var router = express.Router();

    router
        .get('/', function (req, res) {
            res.redirect('../');
        })
        .get('/register', (req, res) => res.render('auth/register'))
        .get('/login', (req, res) => res.render('auth/login'));

    return router;
}