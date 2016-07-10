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
