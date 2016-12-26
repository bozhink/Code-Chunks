
    'segment.bas
    'This program demonstrates the use of graphics
    'segments.  Five graphic segments are drawn, and
    'then the second and fourth are deleted.  Then
    'the window is redrawn, causing the first, third,
    'and fifth segments to be redrawn automatically.

    'Open a graphics window
    open "segment demo" for graphics as #draw
    print #draw, "trapclose [quit]"

    'Set up a large font and put the pen in the
    'upper left corner
    print #draw, "font arial 20"
    print #draw, "place 10 25"

    'Draw the words ONE, TWO, THREE, FOUR and FIVE
    'each in its own segment (this is done with the
    'flush command).
    print #draw, "\ONE"
    print #draw, "flush"
    print #draw, "\TWO"
    print #draw, "flush"
    print #draw, "\THREE"
    print #draw, "flush"
    print #draw, "\FOUR"
    print #draw, "flush"
    print #draw, "\FIVE"
    print #draw, "flush"

    'Now delete the second and fourth segments, leaving
    'only the drawn words ONE, THREE, and FIVE
    print #draw, "delsegment 2"
    print #draw, "delsegment 4"

    'Now redraw so that the graphics will be displayed
    'without the deleted segments.
    print #draw, "redraw"

    wait

[quit]
    close #draw
    end
