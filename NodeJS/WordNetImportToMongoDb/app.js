const PATH_TO_WORDNET_DICT = '/home/bozhin/tmp/dict';

var fs = require('fs'),
    MongoClient = require('mongodb').MongoClient,
    Server = require('mongodb').Server;

// Set up the connection to the local db
var mongoclient = new MongoClient(new Server("localhost", 27017), {native_parser: true});

function readFrom(db, collectionName, callback) {
    var collection = db.collection(collectionName);
    collection.find().toArray(function (error, data) {
        if (error) {
            throw error;
        }

        // console.dir(data);

        if (callback) {
            callback(data);
        }
    });
}

function insertInto(db, collectionName, object, callback) {
    var collection = db.collection(collectionName);

    console.log(`Inserting '${object}' into collection '${collectionName}'.`);

    collection.insert(object, function (error, data) {
        if (error) {
            throw error;
        }

        console.log(`'${object}' inserted into collection ${collectionName}.`);

        if (callback) {
            callback(data);
        }
     });
}

function getSeedFiles(path, callback) {
    var file,
        result = [],
        files = fs.readdirSync(path);

    for (file of files) {
        if (file.substring(0, 5) === 'data.') {
            result.push(file);
        }
    }

    return result;
};

function importFile(path, fileName, db) {
    fs.readFile(path + '/' + fileName, 'utf8', function (error, data) {
        var line, lines = [];

        if (error) {
            throw error;
        }

        lines = ('' + data).replace(/\r?\n/g, '\n')
            .split(/\n/)
            .slice(29);

        // for (line of lines.slice(0, 3)) {
        //     console.log(line);
        // }
    });
};

console.log(getSeedFiles(PATH_TO_WORDNET_DICT));

MongoClient.connect("mongodb://localhost:27017/wordnet", function (error, db) {
    if (error) {
        throw error;
    }

    importFile(PATH_TO_WORDNET_DICT, 'data.adv', db);
});
