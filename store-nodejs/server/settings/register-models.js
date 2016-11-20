var  _ = require('underscore');

module.exports = function (wagner) {
    var models = {
        Category: wagner.invoke(require('../data/models/category')),
        Product: wagner.invoke(require('../data/models/product')),
        User: wagner.invoke(require('../data/models/user'))
    };

    // To ensure DRY-ness, register factories in a loop
    _.each(models, function (value, key) {
        wagner.factory(key, function () {
            return value;
        });
    });

    return models;
};