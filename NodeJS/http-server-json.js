var http = require('http'),
    port = 1234;

http.createServer(function (request, response) {
    response.writeHead(200, {
        'Content-Type': 'text/plain'
    }); // return success header

    response.write(JSON.stringify(http)); // response
    response.end(); // finish processing current request
}).listen(port);

console.log(`Server is runnig on port ${port}`);