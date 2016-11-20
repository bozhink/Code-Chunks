var fs = require('fs');

module.exports = function (wagner) {
    wagner.factory('Config', function () {
        return JSON.parse(fs.readFileSync('./credentials/config.json').toString());
    });
};