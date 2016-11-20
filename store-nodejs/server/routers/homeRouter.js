var express = require('express');

module.exports = function () {
    'use strict';

    var router = express.Router();

    router
        .get('/', function (req, res) {
            res.render('index', {
                title: 'Hey',
                message: 'Hello there!'
            });
        })
        .get('/help', (req, res) => res.render('help'))
        .get('/contacts', (req, res) => res.render('contacts'))
        .get('/about', (req, res) => res.render('about'));

    return router;
}