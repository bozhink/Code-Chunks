var Db = require('mongodb').Db,
    MongoClient = require('mongodb').MongoClient,
    Server = require('mongodb').Server,
    mongoClient = new MongoClient(new Server('localhost', 27017));

function readFrom(db, collectionName, callback) {
    var collection = db.collection(collectionName);
    collection.find().toArray(function (err, data) {
        if (err) {
            throw err;
        }
        
        console.dir(data);
        
        if (callback) {
            callback(data);
        }
    });
}

function insertInto(db, collectionName, object, callback) {
    var collection = db.collection(collectionName);
    
    console.log(`Inserting ${object} into collection ${collectionName}.`);
    
    collection.insert(object, function (err, data) {
       console.log(`${object} inserted into collection ${collectionName}.`);
       
       if (callback) {
           callback(data);
       } 
    });
}

mongoClient.open(function (err, mongoclient) {
    
});
