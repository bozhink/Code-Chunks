var Stripe = require('stripe');

module.exports = function (Config) {
    return Stripe(Config.stripeKey);
};