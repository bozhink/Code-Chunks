var Redis = require('ioredis'),
    redis = new Redis({
        host: 'localhost',
        port: 6379,
        /*password: ''*/
    });

redis.set('best_car_ever', 'Tesla Model S', function (err, result) {
    console.log(result);
});

redis.get('best_car_ever', function (err, result) {
    console.log(result);
});

redis.del('best_car_ever', function (err, result) {
    console.log(result);
});

redis.get('best_car_ever', function (err, result) {
    console.log(result);
});

var Redis = require('ioredis');
var redis = new Redis();

redis.set('foo', 'bar');
redis.get('foo', function (err, result) {
  console.log(result);
});

// Or using a promise if the last argument isn't a function
redis.get('foo').then(function (result) {
  console.log(result);
});

// Arguments to commands are flattened, so the following are the same:
redis.sadd('set', 1, 3, 5, 7);
redis.sadd('set', [1, 3, 5, 7]);

// All arguments are passed directly to the redis server:
redis.set('key', 100, 'EX', 10);


var pipeline = redis.pipeline();
pipeline.set('foo', 'bar');
pipeline.del('cc');
pipeline.exec(function (err, results) {
  // `err` is always null, and `results` is an array of responses
  // corresponding to the sequence of queued commands.
  // Each response follows the format `[err, result]`.
});

// You can even chain the commands:
redis.pipeline().set('foo', 'bar').del('cc').exec(function (err, results) {
});

// `exec` also returns a Promise:
var promise = redis.pipeline().set('foo', 'bar').get('foo').exec();
promise.then(function (result) {
  // result === [[null, 'OK'], [null, 'bar']]
});

redis.pipeline([
  ['set', 'foo', 'bar'],
  ['get', 'foo']
]).exec(function () { /* ... */ });

redis.multi().set('foo').set('foo', 'new value').exec(function (err, results) {
  // err:
  //  { [ReplyError: EXECABORT Transaction discarded because of previous errors.]
  //    name: 'ReplyError',
  //    message: 'EXECABORT Transaction discarded because of previous errors.',
  //    command: { name: 'exec', args: [] },
  //    previousErrors:
  //     [ { [ReplyError: ERR wrong number of arguments for 'set' command]
  //         name: 'ReplyError',
  //         message: 'ERR wrong number of arguments for \'set\' command',
  //         command: [Object] } ] }
});

redis.multi().set('foo', 'bar', function (err, result) {
  // result === 'QUEUED'
}).exec(/* ... */);

redis.multi({ pipeline: false });
redis.set('foo', 'bar');
redis.get('foo');
redis.exec(function (err, result) {
  // result === [[null, 'OK'], [null, 'bar']]
});

redis.multi([
  ['set', 'foo', 'bar'],
  ['get', 'foo']
]).exec(function () { /* ... */ });

redis.pipeline().get('foo').multi().set('foo', 'bar').get('foo').exec().get('foo').exec();

