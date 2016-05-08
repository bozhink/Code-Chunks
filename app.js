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
}, function(error, response) {
    console.log(response);
});

// Retrieve email
client.get({
    index: 'emails',
    type: 'email',
    id: 1
}, function(error, response) {
    console.log(response);
});

// Index multiple emails
client.bulk({
    index: 'emails',
    type: 'email',
    body: [{
        index: {
            _id: 2
        }
    }, {
        from: 'tony@stark.com',
        to: ['thor@avengers.org', 'hulk@avengers.org'],
        subject: 'Re: Greetings, Earthlings!'
    }, {
        index: {
            _id: 3
        }
    }, {
        from: 'thor@avengers.org',
        to: ['tony@stark.com', 'hulk@avengers.org'],
        subject: 'Re: Greetings, Earthlings!'
    }, {
        index: {
            _id: 4
        }
    }, {
        from: 'hulk@avengers.org',
        to: ['tony@stark.com', 'thor@avengers.org'],
        subject: 'Re: Greetings, Earthlings!'
    }, {
        index: {
            _id: 5
        }
    }, {
        from: 'tony@stark.com',
        to: 'natasha@avengers.org',
        subject: 'Fwd: Greetings, Earthlings!',
        body: 'Banner is freaking out'
    }, {
        index: {
            _id: 6
        }
    }, {
        from: 'natasha@avengers.org',
        to: 'hulk@avengers.org',
        subject: 'Coffee?',
        body: 'Hey Bruce, long time no see. Free for c'
    }, ]
}, function (error, response) {
    console.log(JSON.stringify(response));
});

// Search for emails to the Hulk after a certain time
client.search({
    index: 'emails',
    type: 'email',
    body: {
        query: {
            bool: {
                must: [
                    { match: { to: 'hulk@avengers.org' } },
                    { range: { sent: { gte: '2015-06-30T00:00:00Z' } } }
                ]
            }
        }
    }
}, function (error, response) {
    console.log(JSON.stringify(response));
});

