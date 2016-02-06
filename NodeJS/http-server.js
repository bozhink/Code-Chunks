var http = require('http');

http.createServer(function (request, response) {
    response.writeHead(200, {
        'Content-Type': 'text/plain'
    }); // return success header

    response.write('My server is running! ^_^\n'); // response
    response.end(); // finish processing current request
}).listen(1234);