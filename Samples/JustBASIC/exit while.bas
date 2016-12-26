
    for x = 1 to 5
    print "run number "; x
    a = 0
    while a < 50
        a = a + 1
        print a
        if rnd(1) > 0.7 then exit while
    wend
    next x

    wait
