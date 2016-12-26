
    ' This is a turtle graphics demo

    dim color$(3)

    color$(0) = "red"
    color$(1) = "green"
    color$(2) = "yellow"
    color$(3) = "blue"

    print "Opening Graphics Window"
    open "Turtle Graphics Spiral" for graphics_fs as #turtleOut

    print "Writing spiral data..."

    print #turtleOut, "home"
    print #turtleOut, "down"
    print #turtleOut, "north"
    print #turtleOut, "fill black"
    print #turtleOut, "size 8"

    for x = 1 to 200
        print #turtleOut, "color "; color$(x - int(x/4) * 4)
        print #turtleOut, "turn 122"
        print #turtleOut, "go "; x*2
    next x

    print #turtleOut, "flush"

    input r$

    print "Closing Window" : print
    close #turtleOut

    print "Done."


