
    nomainwin
    dim screen$(25)
    for x = 0 to 24
        screen$(x) = "                                                                                "
    next x
    curX = 1
    curY = 0
    curYCache = 12
    lineCache$ = screen$(0)

    graphicbox #main.graphics, 1, 1, 2000, 2000
    open "graph me!" for window as #main
    print #main.graphics, "font courier_new 10"
    print #main.graphics, "autoresize"
    print #main, "resizehandler [draw]"
    print #main.graphics, "when characterInput [getChar]"
    print #main.graphics, "color white ; backcolor black" : rem " these quotes!
    print #main.graphics, "fill black"
    print #main.graphics, "flush"
    print #main, "trapclose [quit]"
    goto [draw]

[loop]

    if time < time$("milliseconds") then
        time = time$("milliseconds") + 500
        curVisible = switchCursor(curVisible, curX, curY)
    end if
    print #main.graphics, "setfocus"
    scan
    goto [loop]


sub displayAll screenId, scrollUp   'this is a test

    if screenId <> 0 then print #main.graphics, "delsegment "; screenId
    for x = 0 to 23
        if scrollUp then screen$(x) = screen$(x + 1)
        print #main.graphics, "place 2 "; 15 * x + 12
        print #main.graphics, "|"; screen$(x)
    next x

end sub


[getChar]

    char$ = Inkey$
    if len(char$) <> 1 then [loop]

  [oneChar]

    if curVisible = 1 then curVisible = switchCursor(curVisible, curX, curY)

    if char$ > chr$(31) then [visibleChar]
    if char$ = chr$(_VK_RETURN) then [cr]
    if char$ = chr$(_VK_BACK) and curX > 1 then [backspace] else [loop]

[visibleChar]

    lineCache$ = left$(lineCache$, curX - 1) + char$ + mid$(lineCache$, curX + 1)
    print #main.graphics, "place "; (curX - 1) * 8 + 2; " "; curYCache
    print #main.graphics, "|"; char$
    print #main.graphics, "discard"
    time = 0

    curX = curX + 1
    if curX < 81 then [loop]

    goto [cr]

[backspace]

    curX = curX - 1

    lineCache$ = left$(lineCache$, curX - 1) + " " +  mid$(lineCache$, curX + 1)
    print #main.graphics, "place "; (curX - 1) * 8 + 2; " "; curYCache
    print #main.graphics, "|"; " "
    print #main.graphics, "discard"
    time = 0
    goto [loop]

[cr]

    time = 0
    curX = 1
    if curY < 23 then
        screen$(curY) = lineCache$
        curY = curY + 1
        curYCache = curY * 15 + 12
        lineCache$ = screen$(curY)
    else
        call displayAll screenId, 1    'the 1 forces a scroll up
    end if
    goto [loop]

[draw]

    if curVisible then  curVisible = switchCursor(curVisible, curX, curY)
    screen$(curY) = lineCache$
    call displayAll screenId, 0
    goto [loop]

[quit]

    close #main
    end


function switchCursor(switchCursor, drawX, drawY)

    print #main.graphics, "place "; (drawX - 1)*8+2; " "; drawY*15+12
    print #main.graphics, "down ; north ; size 2 ; rule xor ; color black ; go 14 ; color white ; rule over"
    switchCursor = abs(switchCursor - 1)   'trade 0 for 1, or 1 for 0

end function

