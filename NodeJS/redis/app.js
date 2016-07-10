var redis = require('redis'),
    client = redis.createClient();

client.on('error', function (err) {
    console.error('Error ' + err);
});

client.set('string key', 'string value', redis.print);
client.hset('hash key', 'hashtest 1', 'some value', redis.print);
client.hset(['hash key', 'hashtest 2', 'some other value'], redis.print);
client.hkeys('hash key', function (err, data) {
    console.log(data.length + ' replies:');
    data.forEach(function (item, i) {
        console.log(`    ${i}: ${item}`);
    });
    client.quit();
});


