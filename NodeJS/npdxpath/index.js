const xpath = require('xpath'),
    dom = require('xmldom').DOMParser,
    fs = require('fs');



fs.readFile('12035.xml', 'utf8', (error, data) => {
    var xml, doc, nodes;

    if (error) {
        throw error;
    }

    xml = data.toString();
    doc = new dom().parseFromString(xml);
    nodes = xpath.select('//article-title', doc);
    console.log(nodes[0].localName + ': ' + nodes[0].textContent);
    //console.log(`Node: ${nodes[0].toString()}`)
});






