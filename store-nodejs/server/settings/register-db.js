const connectionString = 'mongodb://localhost:27017/test';

var mongoose = require('mongoose');

module.exports = function (wagner) {
    mongoose.connect(connectionString);

    wagner.factory('db', function () {
        return mongoose;
    });
};