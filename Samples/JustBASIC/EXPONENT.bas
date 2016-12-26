    'draw an exponential graph
    open "Here is an exponential curve" for graphics as #g

    print #g, "color blue"
    print #g, "down"

    for x = 1 to 300 step 25
        print #g, "line "; x ; " 0"; " "; x ; " 350"
        print #g, "line 0 "; x; " 350 "; x
    next x

    print #g, "place 0 0"
    print #g, "color red"

    for x = 1 to 270 step 10
        print #g, "goto "; x ; " "; (x * x / 260) + 10
        print #g, "place "; x ; " "; (x * x / 260) + 10
        print #g, "\o"
    next x

    print #g, "place 0 32"
    print #g, "color green"
    print #g, "\\\Exponential \Plot "

        print #g, "flush"

    input r$

    close #g
