var fs = require('fs'),
    generatedFileName = 'generated.json',
    content = fs.readFileSync(generatedFileName, 'utf8'),
    dataArray = JSON.parse(content),
    MongoClient = require('mongodb').MongoClient,
    assert = require('assert');

MongoClient.connect('mongodb://localhost:27001/test', function(err, db) {
    assert.equal(err, null);
    console.log("Successfully connected to MongoDB.");

    var i, status = [],
        len = dataArray.length;

    for (i = 0; i < len; i += 1) {
        db.collection("generated").insertOne(dataArray[i], function(err, result) {
            assert.equal(err, null);
            status.push(result);
        })
    }
    
    setInterval(function () {
        if (status.length === len) {
            var result = db.close();
            process.exit(0);
        }
    }, 1000)
});