
    'show how to use RGB colors
    graphicbox #1.graphics, 10, 10, 250, 240
    open "graphics" for window as #1
    print #1.graphics, "size 2 ; down ; fill black"
    for x = 10 to 250 step 2
        color = x
        print #1.graphics, "color "; 255; " "; color; " 0 "
        print #1.graphics, "place 0 "; (x-10); " ; goto 250 "; (x-10)
    next x
    print #1.graphics, "flush"

    wait

