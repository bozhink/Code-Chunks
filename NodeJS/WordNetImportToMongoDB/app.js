var fs = require('fs'),
    MongoClient = require('mongodb').MongoClient,
    Server = require('mongodb').Server,
    config = require('./config');

function getSeedFiles(path, callback) {
    var file,
        result = [],
        files = fs.readdirSync(path);

    for (file of files) {
        if (file.substring(0, config.dataFilePrefix.length) === config.dataFilePrefix) {
            result.push(file);
        }
    }

    return result;
};

function importFile(path, fileName, wordType, db, collectionName) {
    fs.readFile(path + '/' + fileName, 'utf8', function (error, data) {
        var object, line, lines = [];

        if (error) {
            throw error;
        }

        lines = ('' + data).replace(/\r?\n/g, '\n')
            .split(/\n/)
            .slice(29);

        for (line of lines) {
            object = processLine(line);
            if (object != null) {
                object.type = wordType;
                insertInto(db, collectionName, object);
            }
        }
    });
    
    function processLine(line) {
        var word, definition, lineSplit = line.split('|');

        if (lineSplit [0]) {
            word = lineSplit [0].substring(17).trim();
            word = word.substring(0, word.indexOf(' '));
        }

        if (lineSplit [1]) {
            definition = lineSplit [1].trim();
        }

        if (word == null) {
            return null;
        } else {
            return {
                word: word.replace(/_/g, ' '),
                definition: definition
            };
        }
    }
    
    function insertInto(db, collectionName, object, callback) {
        var collection = db.collection(collectionName);

        collection.insert(object, function (error, data) {
            if (error) {
                throw error;
            }

            if (callback) {
                callback(data);
            }
        });
    }
};

function importAllFiles(db) {
    var file,
        files = getSeedFiles(config.pathToWordNetDictionary),
        prefixLength = config.dataFilePrefix.length;
    
    for (file of files) {
        importFile(config.pathToWordNetDictionary, file, file.substring(prefixLength), db, config.collectionName);
    }
}

console.log(getSeedFiles(config.pathToWordNetDictionary));

MongoClient.connect(config.connectionString, function (error, db) {
    if (error) {
        throw error;
    }

    importAllFiles(db);
});
