// https://www.npmjs.com/package/elasticsearch-csv
// npm install elasticsearch-csv

var ElasticsearchCsv = require('elasticsearch-csv');

var esCsv = new ElasticsearchCsv({
    es: {
        index: 'grbio',
        type: 'institutions',
        host: 'localhost'
    },
    
    csv: {
        filePath: '/tmp/grbio/grbio_institutions.csv',
        headers: true
    }
});

esCsv.import()
    .then(function (response) {
        console.log(response);
    }, function (error) {
        throw error;
    });
