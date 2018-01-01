var edge = require('edge');

var helloWorld = edge.func(function () {
    /*
     async (input) => {
       return ".NET" + input.ToString();
     }
     */
});

var foo = function () {
    var selection = window.getSelection().getRangeAt(0);
    var selectedText = selection.extractContents();
    var span = document.createElement("span");
    span.style.backgroundColor = "yellow";
    span.appendChild(selectedText);
    selection.insertNode(span);
}


helloWorld('JavaScipt', function (error, result){
    if (error) {
        throw error;
    }

    console.log(result);
})