'use strict';

var http = require('http'),
    fs = require('fs');

function makeRequest(id, object) {
    var jsonData = JSON.stringify(object),
        requestOptions = {
            hostname: 'localhost',
            port: 9200,
            path: `/mimetypes/type/${encodeURI(id)}`,
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
                'Content-Length': jsonData.length
            }
        },
        request = http.request(requestOptions, (response) => {
            // console.log(`STATUS: ${response.statusCode}`);
            // console.log(`HEADERS: ${JSON.stringify(response.headers)}`);
            
            response.setEncoding('utf8');
            
            response.on('data', (chunk) => {
                // console.log(`BODY:  ${chunk}`);
            });
            
            response.on('end', () => {
                // console.log('No more data in response.');
            });
        });
        
        request.on('error', (e) => {
            console.log(`Error in request: ${e.message}`);
        });
        
        request.write(jsonData);
        request.end();
}

var fileContent = fs.readFileSync('mime.types', 'utf8'),
    lines = fileContent.replace(/(\r?\n)+/g, '\n').split('\n');

console.log(lines.length);

for (let line of lines) {
    let lineSplit = line.split('\t'),
        typepair = lineSplit[1].split('/'),
        mimetypeObject = {
            name: lineSplit[0],
            mimetype: typepair[0],
            mimesubtype: typepair[1]
        };
    
    makeRequest(mimetypeObject.name, mimetypeObject);
}



