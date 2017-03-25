var edge = require('edge'),
    path = require('path');

var helloWorld = edge.func(`
    async (input) => {
        return ".NET Welcomes " + input.ToString();
    }
`);

helloWorld('JavaScript', function (error, result) {
    if (error) {
        throw error;
    }

    console.log(result);
});

var add7 = edge.func(path.join(__dirname, 'AddSeven.cs'));

add7(7, function (error, result) {
    if (error) {
        throw error;
    }

    console.log(result);
});

// Python

// var pyHello = edge.func('py', function () {
//     /*
//         def hello(input):
//             return "Python welcomes " + str(input)

//         lambda x: hello(x)
//     */
// });

// pyHello('Node.js', function (error, result) {
//     if (error) {
//         throw error;
//     }

//     console.log(result);
// })