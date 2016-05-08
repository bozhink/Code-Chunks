var es = require('elasticsearch'),
    client = new es.Client({
        host: 'localhost:9200'
    });

client.index({
    index: 'emails',
    type: 'email',
    id: 1,
    body: {
        from: 'thor@avengers.org',
        to: [
            'tony@stark.com',
            'hulk@avengers.org'
        ],
        subject: 'Greetings, Earthlings!',
        body: 'Hey guys, heard from Jane lately!?',
        sent: '2015-06-29T08:30:23-0700'
    }
}, function (error, response) {
    console.log(response);
});

// Retrieve email
client.get({
    index: 'emails',
    type: 'email',
    id: 1
}, function (error, response) {
    console.log(response);
});