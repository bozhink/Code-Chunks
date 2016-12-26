
    ' Hanoi.bas

    ' This simple Just BASIC program let's the user
    ' play the puzzle "Tower of Hanoi".

    ' We don't want a main window
    nomainwin

    ' Prepare the variables that hold the disk data
    tiny = 1
    small = 1
    medium = 1
    large = 1


    gosub [openWindow]
    gosub [drawPuzzle]

    print #hanoi, "when leftButtonUp [beginMove]" ;

[inputLoop]

    if hanoiStarted = 0 then print #hanoi, "redraw" ; : hanoiStarted = 1
    input r$
    goto [inputLoop]




[openWindow]    'Open the puzzle's window

    WindowWidth = 410
    WindowHeight = 300

    open "Tower of Hanoi" for graphics_nsb as #hanoi
    print #hanoi, "trapclose [quitHanoi]" ;

    return


[drawPuzzle]    ' Draw the pegs

    print #hanoi, "cls ; fill black ; down ; backcolor black" ;
    print #hanoi, "color darkgray ; size 10 ; line 100 120 100 220" ;
    print #hanoi, "line 200 120 200 220" ;
    print #hanoi, "line 300 120 300 220" ;
    print #hanoi, "color lightgray ; size 15 ; line 0 220 400 220" ;


[drawDisks]     ' Draw the disks

    peg1 = 207
    peg2 = 207
    peg3 = 207

    if large <> 1 then [largeIsNotOne]
    print #hanoi, "size 10 ; color red" ;
    print #hanoi, "line 60 "; peg1; " 140 "; peg1 ;
    peg1 = peg1 - 10
    goto [drawMedium]

[largeIsNotOne]

    if large <> 2 then [largeIsNotTwo]
    print #hanoi, "size 10 ; color red" ;
    print #hanoi, "line 160 "; peg2; " 240 "; peg2 ;
    peg2 = peg2 - 10
    goto [drawMedium]

[largeIsNotTwo]

    print #hanoi, "size 10 ; color red" ;
    print #hanoi, "line 260 "; peg3; " 340 "; peg3 ;
    peg3 = peg3 - 10


[drawMedium]    ' Draw the medium size disk

    if medium <> 1 then [mediumIsNotOne]
    print #hanoi, "size 10 ; color green" ;
    print #hanoi, "line 70 "; peg1; " 130 "; peg1 ;
    peg1 = peg1 - 10
    goto [drawSmall]

[mediumIsNotOne]

    if medium <> 2 then [mediumIsNotTwo]
    print #hanoi, "size 10 ; color green" ;
    print #hanoi, "line 170 "; peg2; " 230 "; peg2 ;
    peg2 = peg2 - 10
    goto [drawSmall]

[mediumIsNotTwo]

    print #hanoi, "size 10 ; color green" ;
    print #hanoi, "line 270 "; peg3; " 330 "; peg3 ;
    peg3 = peg3 - 10

[drawSmall]    ' Draw the small size disk

    if small <> 1 then [smallIsNotOne]
    print #hanoi, "size 10 ; color blue" ;
    print #hanoi, "line 80 "; peg1; " 120 "; peg1 ;
    peg1 = peg1 - 10
    goto [drawTiny]

[smallIsNotOne]

    if small <> 2 then [smallIsNotTwo]
    print #hanoi, "size 10 ; color blue" ;
    print #hanoi, "line 180 "; peg2; " 220 "; peg2 ;
    peg2 = peg2 - 10
    goto [drawTiny]

[smallIsNotTwo]

    print #hanoi, "size 10 ; color blue" ;
    print #hanoi, "line 280 "; peg3; " 320 "; peg3 ;
    peg3 = peg3 - 10


[drawTiny]    ' Draw the tiny size disk

    if tiny <> 1 then [tinyIsNotOne]
    print #hanoi, "size 10 ; color yellow" ;
    print #hanoi, "line 90 "; peg1; " 110 "; peg1 ;
    peg1 = peg1 - 10
    goto [finishDrawing]

[tinyIsNotOne]

    if tiny <> 2 then [tinyIsNotTwo]
    print #hanoi, "size 10 ; color yellow" ;
    print #hanoi, "line 190 "; peg2; " 210 "; peg2 ;
    peg2 = peg2 - 10
    goto [finishDrawing]

[tinyIsNotTwo]

    print #hanoi, "size 10 ; color yellow" ;
    print #hanoi, "line 290 "; peg3; " 310 "; peg3 ;
    peg3 = peg3 - 10


[finishDrawing]

    print #hanoi, "flush" ;

    return


[beginMove]     ' Start to move a disk

    if MouseX < 60 or MouseX > 340 then notice "Oops! No pin there!" : goto [inputLoop]
    if MouseY > 215 or MouseY < 120 then notice "Oops! No pin there!" : goto [inputLoop]

    peg = int((MouseX + 50) / 100)

    noDisks$ = "There are no disk on that pin!"
    if tiny <> peg and small <> peg and medium <> peg and large <> peg then notice noDisks$ : goto [inputLoop]

    print #hanoi, "place 10 10 ; color white ; backcolor black" ;
    print #hanoi, "\\ Peg "; peg; " has been selected.\ Please select a destination peg." ;

    print #hanoi, "when leftButtonUp [endMove]" ;

    goto [inputLoop]


[endMove]   ' Finish moving a disk

    if MouseX < 60 or MouseX > 340 then notice "Oops! No pin there!" : goto [inputLoop]
    if MouseY > 215 or MouseY < 120 then notice "Oops! No pin there!" : goto [inputLoop]

    ontoPeg = int((MouseX + 50) / 100)
    if ontoPeg = peg then [resetSelection]

    ' Determine which disk to move
    if large = peg then disk$ = "large"
    if medium = peg then disk$ = "medium"
    if small = peg then disk$ = "small"
    if tiny = peg then disk$ = "tiny"

    ' Determine if move is legal
    moveOnto$ = "nothing"
    if large = ontoPeg then moveOnto$ = "large"
    if medium = ontoPeg then moveOnto$ = "medium"
    if small = ontoPeg then moveOnto$ = "small"
    if tiny = ontoPeg then moveOnto$ = "tiny"

    if moveOnto$ = "nothing" then [finishMove]

    if disk$ = "large" and moveOnto$ = "medium" then [illegalMove]
    if disk$ = "large" and moveOnto$ = "small" then [illegalMove]
    if disk$ = "medium" and moveOnto$ = "small" then [illegalMove]
    if disk$ = "medium" and moveOnto$ = "tiny" then [illegalMove]
    if disk$ = "small" and moveOnto$ = "tiny" then [illegalMove]

[finishMove]

    print #hanoi, "when leftButtonUp [beginMove]"

    if disk$ = "large" then large = ontoPeg
    if disk$ = "medium" then medium = ontoPeg
    if disk$ = "small" then small = ontoPeg
    if disk$ = "tiny" then tiny = ontoPeg

    gosub [drawPuzzle]
    if tiny = 3 and small = 3 and medium = 3 and large = 3 then [youWin]

    goto [inputLoop]


[illegalMove]

    notice "That move is not allowed!"


[resetSelection]

    print #hanoi, "when leftButtonUp [beginMove]" ;
    print #hanoi, "place 10 10 ; color black ; backcolor black" ;
    print #hanoi, "\\ Peg "; peg; " has been selected.\ Please select a destination peg." ;
    goto [inputLoop]


[youWin]

    beep
    notice "You win!"
    confirm "Play another?"; answer$
    if answer$ = "no" then [quitHanoi]

    tiny = 1
    small = 1
    medium = 1
    large = 1
    gosub [drawPuzzle]
    goto [inputLoop]


[quitHanoi]

    print #hanoi, "trapclose"
    close #hanoi
    end
