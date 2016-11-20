var categorySchema = require('./categorySchema')(),
    currencySymbols = require('../enums/currencySymbols');

var ProductSchema = function (fx) {
    return {
        name: {
            type: String,
            required: true
        },
        // Pictures must start with "http://"
        pictures: [{
            type: String,
            match: /^http:\/\//i
        }],
        price: {
            amount: {
                type: Number,
                required: true,
                set: function (v) {
                    this.internal.approximatePriceUSD = v / (fx()[this.price.currency] || 1);
                    return v;
                }
            },
            // Only 3 supported currencies for now
            currency: {
                type: String,
                enum: Object.keys(currencySymbols),
                required: true,
                set: function (v) {
                    this.internal.approximatePriceUSD = this.price.amount / (fx()[v] || 1);
                    return v;
                }
            }
        },
        category: categorySchema,
        internal: {
            approximatePriceUSD: Number
        }
    };
};

module.exports = ProductSchema;