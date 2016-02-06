var http = require('http');

http.get('http://www.google.com/index.html', function (response) {
    console.log('Got response: ' + response.statusCode);

    // consume response body
    response.resume();
}).on('error', function (e) {
    console.log('Got error: ' + e.message);
});