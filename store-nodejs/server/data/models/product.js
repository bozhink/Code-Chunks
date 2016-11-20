var mongoose = require('mongoose'),
    ProductSchema = require('../schemas/productSchema'),
    currencySymbols = require('../enums/currencySymbols');

module.exports = function (db, fx) {
    var schema = new mongoose.Schema(new ProductSchema(fx));

    schema.index({
        name: 'text'
    });

    /*
     * Human-readable string form of price - "$25" rather
     * than "25 USD"
     */
    schema.virtual('displayPrice').get(function () {
        return currencySymbols[this.price.currency] + '' + this.price.amount;
    });

    schema.set('toObject', {
        virtuals: true
    });

    schema.set('toJSON', {
        virtuals: true
    });

    return db.model('Product', schema, 'products');
};