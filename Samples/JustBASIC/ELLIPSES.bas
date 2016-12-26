
    ' draw some ellipses

    nomainwin

    colorPool$ = "red green blue"
    open "Ellipses" for graphics as #1
        print #1, "trapclose [quit]"
        print #1, "down"
        print #1, "place 130 130"
        for x = 30 to 230 step 10
            gosub [nextColor]
            print #1, "ellipse "; x ; " "; 260 - x
        next x
        print #1, "flush"
        wait

[nextColor]   'pick the next in the cycle of colors
    while color$ = ""
        colorIndex = colorIndex + 1
        color$ = word$(colorPool$, colorIndex)
        if color$ = "" then colorIndex = 0
    wend
    print #1, "color "; color$
    color$ = ""
    return

[quit]
    close #1
    end
