var fx = require('../services/exchangerates'),
    stripe = require('../services/stripe');

module.exports = function (wagner) {
    wagner.factory('fx', fx);

    wagner.factory('Stripe', stripe);
};