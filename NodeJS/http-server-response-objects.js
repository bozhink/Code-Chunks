var http = require('http'),
    port = 1234;

http.createServer(function (request, response) {
    if (request.url === '/login') {
        response.writeHead(200, {
            'Content-Type': 'text/html',
            'Set-Cookie': [
                'type=ninja',
                'language=javascript'
            ]
        });

        response.write('Login page!');
    } else {
        response.writeHead(404, {
            'Content-Type': 'text/html',
            'Set-Cookie': [
                'type=ninja',
                'language=javascript'
            ]
        });

        response.write('404 not found');
    }

    response.write('<br />Copyright &copy;');
    response.end();
}).listen(port);

console.log(`Server is runnig on port ${port}`);