var http = require('http'),
    url = require('url'),
    port = 1234;

http.createServer(function (request, response) {
    var parseUrl = url.parse(request.url, true),
        amICooler = parseUrl.query.amICooler;

    if (amICooler === 'no') {
        response.writeHead(400, {
            'Content-Type': 'application/json'
        });

        response.write('Error!');
        response.end();
    } else {
        response.writeHead(200, {
            'Content-Type': 'application/html'
        });

        response.write('Yes.');
        response.end();
    }

}).listen(port);