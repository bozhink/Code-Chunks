var mongoose = require('mongoose'),
    CategorySchema = require('../schemas/categorySchema');

module.exports = function (db) {
    var schema = new mongoose.Schema(new CategorySchema());

    return db.model('Category', schema, 'categories');
};