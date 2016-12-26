
    ' This is a turtle graphics demo

    nomainwin ' open no main window

    size$ = "100"
    size = val(size$)
    color$ = "black"

    button #1, "Triangle", [triangle], LR, 170, 10
    button #1, "Square", [square], LR, 90, 10
    button #1, "Size", [size], LR, 25, 10
    button #1, "Red", [colorRed], UL, 5, 5
    button #1, "Blue", [colorBlue], UL, 46, 5
    button #1, "Green", [colorGreen], UL, 95, 5
    menu #1, &Colors, &red, [colorRed], &blue, [colorBlue], &green, [colorGreen]
    menu #1, &Graph, &square, [square], &triangle, [triangle], &size, [size], |, &quit, [quit]
    open "This is a turtle graphics window!" for graphics_nsb as #1

    print #1, "trapclose [quit]"

    'wait here for user interaction
    wait


[triangle]

    print #1, "color "; color$
    print #1, "cls ; home ; down ; north"

    for x = 1 to size
        print #1, "turn 122 ; go "; str$(x*2)
    next x

    print #1, "flush"

    'wait here for user interaction
    wait


[square]

    print #1, "color "; color$
    print #1, "cls ; home ; down ; north"

    for x = 1 to size
        print #1, "turn 88 ; go "; str$(x*2)
    next x

    print #1, "flush"

    'wait here for user interaction
    wait


[colorRed]

    color$ = "red"

    'wait here for user interaction
    wait


[colorBlue]

    color$ = "blue"

    'wait here for user interaction
    wait


[colorGreen]

    color$ = "green"

    'wait here for user interaction
    wait

[size]

    prompt "What size figure?"; size$
    size = val(size$)
    if size > 0 then wait
    beep
    notice "Size must be > 0"
    goto [size]


[quit]
    confirm "Do you want to quit Buttons?"; quit$
    if quit$ = "no" then wait
    close #1
    end


