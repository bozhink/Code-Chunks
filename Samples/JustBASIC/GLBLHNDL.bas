'show how to use functions with handles
open "global handles" for graphics as #draw
print #draw, "down"
x = drawLine(50, 50, 150, 50)
x = drawLine(50, 100, 150, 100)
x = drawLine(50, 50, 50, 100)
x = drawLine(150, 50, 150, 100)
input r$

function drawLine(a, b, c, d)
    print #draw, "line "; a; " "; b; " "; c; " "; d
end function


