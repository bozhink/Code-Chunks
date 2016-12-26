
    'Test the random number generator to see if it can draw
    'uniformly random dots!
    WindowWidth = 410
    WindowHeight = 440
    open "random generator test" for graphics as #draw
    print #draw, "trapclose [quit]"
    print #draw, "down ; size 2"
    for x = 1 to 5000
        print #draw, "place "; int(rnd(1)*400); " "; int(rnd(1)*400)
        print #draw, "go 1"
    next x

    wait

[quit]
    close #draw
    end