const PATH_TO_WORDNET_DICT = '/home/bozhin/tmp/dict';

var fs = require('fs');

function getSeedFiles(path, callback) {
    return fs.readdir(path, function (err, files) {
        var file, result = [];

        if (err) {
            throw err;
        }

        for (file of files) {
            if (file.substring(0, 5) === 'data.') {
                result.push(file);
            }
        }

        for (file of result) {
            console.log(file);
        }

        return result;
    });
};

console.log(getSeedFiles(PATH_TO_WORDNET_DICT));