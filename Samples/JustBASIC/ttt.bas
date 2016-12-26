
    'Tic Tac Toe
    'Requires Liberty BASIC v2.0 or better
    'Copyright 1993,2001 Shoptalk Systems
    'All Rights Reserved

    nomainwin

    loadbmp "title", "bmp\titlettt.bmp"
    loadbmp "square", "bmp\squarttt.bmp"

    WindowWidth = 314
    WindowHeight = 380
    button #brd, " T ", [1], UL, 10, 60
    button #brd, " I ", [2], UL, 110, 60
    button #brd, " C ", [3], UL, 210, 60
    button #brd, " T ", [4], UL, 10, 160
    button #brd, " A ", [5], UL, 110, 160
    button #brd, " C ", [6], UL, 210, 160
    button #brd, " T ", [7], UL, 10, 260
    button #brd, " O ", [8], UL, 110, 260
    button #brd, " E ", [9], UL, 210, 260
    button #brd, "Pass Move", [skipMove], UL, 210, 10
    open "Tic Tac Toe Playing Board" for graphics_nsb as #brd
    print #brd, "trapclose [quit]";
    print #brd, "size 3 ; down";

[start]    'start game (or restart)

    gosub [drawBoard]
    for x = 1 to 9 : board$(x) = " " : next x
    gosub [modelBoard]
    turn = 0
    true = 1
    false = 0
    pass = false
    moveCounter = 0

[playLoop]


    input position$

  goto [playLoop]


[move]

    ' X moves
    if board$(val(position$)) <> " " then notice "Illegal Move!" : goto [playLoop]
    moveCounter = moveCounter + 1
    pass = false
    board$(val(position$)) = "X"
    gosub [drawX]
    gosub [modelBoard]
    gosub [checkForWinOrDraw]
    position$ = ""
    goto [oMoves]

[skipMove]

    pass = true

[oMoves]

    ' O moves
    gosub [computeMove]
    board$(val(position$)) = "O"
    gosub [drawO]
    gosub [modelBoard]
    gosub [checkForWinOrDraw]

  goto [playLoop]


[1]
    position$ = "1" : goto [move]
[2]
    position$ = "2" : goto [move]
[3]
    position$ = "3" : goto [move]
[4]
    position$ = "4" : goto [move]
[5]
    position$ = "5" : goto [move]
[6]
    position$ = "6" : goto [move]
[7]
    position$ = "7" : goto [move]
[8]
    position$ = "8" : goto [move]
[9]
    position$ = "9" : goto [move]


[drawBoard]

    print #brd, "cls ; fill lightgray ; drawbmp title 7 2";
    for x = 4 to 204 step 100
    for y = 54 to 254 step 100
        print #brd, "drawbmp square "; x; " "; y ;
    next y
    next x
    print #brd, "flush";
  return

[drawX]

    gosub [xlatePosition]
    print #brd, "size 6 ; color darkred";
    print #brd, "line "; squareX-11; " "; squareY-16; " "; squareX+19; " "; squareY+24
    print #brd, "line "; squareX+19; " "; squareY-16; " "; squareX-11; " "; squareY+24
    print #brd, "color red";
    print #brd, "line "; squareX-15; " "; squareY-20; " "; squareX+15; " "; squareY+20
    print #brd, "line "; squareX+15; " "; squareY-20; " "; squareX-15; " "; squareY+20
    print #brd, "flush";

  return


[drawO]

    gosub [xlatePosition]
    print #brd, "size 7 ; color darkblue";
    print #brd, "place "; squareX+5; " "; squareY+5
    print #brd, "circle 20 ; color blue";
    print #brd, "place "; squareX; " "; squareY
    print #brd, "circle 20 ; flush";

  return


[xlatePosition]

    squareX = 55
    if instr("258", position$) > 0 then squareX = 155
    if instr("369", position$) > 0 then squareX = 255

    squareY = int((val(position$)+2)/3)*100+5

  return


[modelBoard]

    row1$ = board$(1)+board$(2)+board$(3)
    row2$ = board$(4)+board$(5)+board$(6)
    row3$ = board$(7)+board$(8)+board$(9)

    col1$ = board$(1)+board$(4)+board$(7)
    col2$ = board$(2)+board$(5)+board$(8)
    col3$ = board$(3)+board$(6)+board$(9)

    diag1$ = board$(1)+board$(5)+board$(9)
    diag2$ = board$(7)+board$(5)+board$(3)

  return



[computeMove]


    'check for instant win!

    if row1$ = "OO " then position$ = "3"
    if row1$ = " OO" then position$ = "1"
    if row1$ = "O O" then position$ = "2"
    if row2$ = "OO " then position$ = "6"
    if row2$ = " OO" then position$ = "4"
    if row2$ = "O O" then position$ = "5"
    if row3$ = "OO " then position$ = "9"
    if row3$ = " OO" then position$ = "7"
    if row3$ = "O O" then position$ = "8"

    if col1$ = "OO " then position$ = "7"
    if col1$ = " OO" then position$ = "1"
    if col1$ = "O O" then position$ = "4"
    if col2$ = "OO " then position$ = "8"
    if col2$ = " OO" then position$ = "2"
    if col2$ = "O O" then position$ = "5"
    if col3$ = "OO " then position$ = "9"
    if col3$ = " OO" then position$ = "3"
    if col3$ = "O O" then position$ = "6"

    if diag1$ = "OO " then position$ = "9"
    if diag1$ = " OO" then position$ = "1"
    if diag1$ = "O O" then position$ = "5"
    if diag2$ = "OO " then position$ = "3"
    if diag2$ = " OO" then position$ = "7"
    if diag2$ = "O O" then position$ = "5"

    'make the purely defensive moves

    if row1$ = "XX " then position$ = "3"
    if row1$ = " XX" then position$ = "1"
    if row1$ = "X X" then position$ = "2"
    if row2$ = "XX " then position$ = "6"
    if row2$ = " XX" then position$ = "4"
    if row2$ = "X X" then position$ = "5"
    if row3$ = "XX " then position$ = "9"
    if row3$ = " XX" then position$ = "7"
    if row3$ = "X X" then position$ = "8"

    if col1$ = "XX " then position$ = "7"
    if col1$ = " XX" then position$ = "1"
    if col1$ = "X X" then position$ = "4"
    if col2$ = "XX " then position$ = "8"
    if col2$ = " XX" then position$ = "2"
    if col2$ = "X X" then position$ = "5"
    if col3$ = "XX " then position$ = "9"
    if col3$ = " XX" then position$ = "3"
    if col3$ = "X X" then position$ = "6"

    if diag1$ = "XX " then position$ = "9"
    if diag1$ = " XX" then position$ = "1"
    if diag1$ = "X X" then position$ = "5"
    if diag2$ = "XX " then position$ = "3"
    if diag2$ = " XX" then position$ = "7"
    if diag2$ = "X X" then position$ = "5"
    if position$ <> "" then return


[attack]

    ' now make the offensive moves

    moves$ = ""

    if instr(diag1$,"X") = 0 then
        moves$ = moves$ + mid$("159", instr(diag1$, " "), 1)
     else
        if instr(diag2$,"X") = 0 then
            moves$ = moves$ + mid$("357", instr(diag2$, " "), 1)
          else
            ' now make random moves
            all$ = row1$ + row2$ + row3$
            for i = 1 to 9
                if mid$(all$, i, 1) = " " then moves$ = moves$ + chr$(48+i)
            next i
            if moves$ = "" then position$ = "" : return
        end if
    end if
    i = int(rnd(1)*len(moves$))+1
    position$ = mid$(moves$, i, 1)
    return

[checkForWinOrDraw]

    ' check for win
    letter$ = "XXX"
    for i = 1 to 2
        if instr(row1$+","+row2$+","+row3$, letter$) then [win]
        if instr(col1$+","+col2$+","+col3$, letter$) then [win]
        if instr(diag1$+","+diag2$, letter$) then [win]
        letter$ = "OOO"
    next i

    'check to see if the board is full
    if instr(row1$+row2$+row3$, " ") then return

    'the game is a draw

    notice "Draw!"
    goto [askPlayAgain]


[win]

    if letter$ = "OOO" then notice "I WIN!  HA HA HA!"
    if letter$ = "XXX" then notice "You win!!! Bummer!"

[askPlayAgain]

    confirm "Play again?"; play$
    if play$ = "yes" then [start]

[quit]

    close #brd
    end


