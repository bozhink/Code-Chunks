// node_redis
// https://github.com/NodeRedis/node_redis

var redis = require("redis"),
    client = redis.createClient();

// if you'd like to select database 3, instead of 0 (default), call
// client.select(3, function() { /* ... */ });

client.on("error", function (err) {
    console.log("Error " + err);
});

// Sending Commands
// Each Redis command is exposed as a function on the client object.
// All functions take either an args Array plus optional callback
// Function or a variable number of individual arguments followed by an optional callback. Examples:

client.hmset(["key", "test keys 1", "test val 1", "test keys 2", "test val 2"], function (err, res) {
    console.error(err);
    console.log(res);
});
// Works the same as
client.hmset("key", ["_test keys 1", "test val 1", "test keys 2", "test val 2"], function (err, res) {
    console.error(err);
    console.log(res);
});
// Or
client.hmset("key", "test keys 1", "test val 1", "test keys 2", "test val 2", function (err, res) {
    console.error(err);
    console.log(res);
});

// Note that in either form the callback is optional:

client.set("some key", "some val");
client.set(["some other key", "some val"]);

// If the key is missing, reply will be null. Only if the Redis Command Reference states something else it will not be null.

client.get("missingkey", function(err, reply) {
    // reply is null when the key is missing
    console.log(reply);
});


/**
Publish / Subscribe

Example of the publish / subscribe API. This program opens two client connections, subscribes to a channel on one of them, and publishes to that channel on the other:
*/

var sub = redis.createClient(), pub = redis.createClient();
var msg_count = 0;

sub.on("subscribe", function (channel, count) {
    pub.publish("a nice channel", "I am sending a message.");
    pub.publish("a nice channel", "I am sending a second message.");
    pub.publish("a nice channel", "I am sending my last message.");
});

sub.on("message", function (channel, message) {
    console.log("sub channel " + channel + ": " + message);
    msg_count += 1;
    if (msg_count === 3) {
        sub.unsubscribe();
        sub.quit();
        pub.quit();
    }
});

sub.subscribe("a nice channel");


client.set("string key", "string val", redis.print);
client.hset("hash key", "hashtest 1", "some value", redis.print);
client.hset(["hash key", "hashtest 2", "some other value"], redis.print);
client.hkeys("hash key", function (err, replies) {
    console.log(replies.length + " replies:");
    replies.forEach(function (reply, i) {
        console.log("    " + i + ": " + reply);
    });
    client.quit();
});
