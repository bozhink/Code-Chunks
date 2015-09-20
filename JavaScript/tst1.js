#!/usr/bin/gjs

var y = 1;
print (y);

function plus1 (x) { return x+1; }
function square(x) { return x*x; }

print (plus1(y));
print (plus1(square(plus1(y))));

var a = [];
a.push(1,2,3);
print(a);
a.reverse();
print(a);

var points = [ {x:0, y:0}, {x:1, y:1} ];
var data = { trial1: [[1,2], [3,4]], trial2: [[2,3], [4,5]] };

points.dist = function() {
    var p1 = this[0];
    var p2 = this[1];
    var a = p2.x - p1.x;
    var b = p2.y - p1.y;
    return Math.sqrt(a*a+b*b);
};

print( points.dist() );


function abs(x) {
    if (x>=0) {
        return x;
    } else {
        return -x;
    }
}

function factorial (n) {
    var product = 1;
    while (n > 1) {
        product *= n;
        n--;
    }
    return product;
}

function factorial2(n) {
    var i, product = 1;
    for (i=2; i<=n; i++) product *= i;
    return product;
}

print (abs ( -factorial(5)));
print (factorial2(5));
