"use strict";
function sortByName(a) {
    var result = a.slice(0);
    result.sort(function (x, y) { return x.name.localeCompare(y.name); });
    return result;
}
var x = 1 /* Male */;
