
    'open a graphical window and display spaceships

    nomainwin
    drawX = 40
    drawY = 40

    WindowWidth = 300
    WindowHeight = 250
    button #1, " OK ", [ok], LR, 40, 20
    open "SPACESHIPS" for graphics as #1
    print #1, "trapclose [ok]"
    print #1, "fill black"
    print #1, "color white"

    for x = 1 to 5
        for y = 1 to 3
            gosub [Spaceships]
            drawY = drawY + 40
            angle = angle + 15
        next y
        drawY = 40
        drawX = drawX + 40
    next x

    wait

[ok]

    close #1

    end

[Spaceships]

    print #1, "color white"
    print #1, "place "; drawX; " "; drawY
    print #1, "north; turn "; angle; "; down; turn 275; go 8; turn 85; go 10; turn 180; size 3; go 14"
    print #1, "size 1"
    print #1, "place "; drawX; " "; drawY
    print #1, "north; turn "; angle; "; turn 85; go 8; turn 275; go 10; turn 180; size 3; go 14"
    print #1, "size 1"
    print #1, "place "; drawX; " "; drawY
    print #1, "north; turn "; angle; "; turn 180; go 10; size 12; go 0"
    print #1, "flush"
    print #1, "size 1"

    return

