var Redis = require('ioredis'),
    redis = new Redis(),
    pub = new Redis();

redis.subscribe('news', 'music', function (err, count) {
  // Now we are subscribed to both the 'news' and 'music' channels.
  // `count` represents the number of channels we are currently subscribed to.
  var i = 0;
  setInterval(function () {
      i += 1;
      pub.publish('news', 'Hello world!' + i);
      pub.publish('music', 'Hello again!' + i);
  }, 3000);
});

redis.on('message', function (channel, message) {
  // Receive message Hello world! from channel news
  // Receive message Hello again! from channel music
  console.log('Receive message %s from channel %s', message, channel);
});

// There's also an event called 'messageBuffer', which is the same as 'message' except
// it returns buffers instead of strings.
redis.on('messageBuffer', function (channel, message) {
  // Both `channel` and `message` are buffers.
  console.log('Message %s from channel %s', message, channel);
});
