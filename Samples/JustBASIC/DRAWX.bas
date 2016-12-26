
    nomainwin

    lineThickness$ = "1"

    menu #1, &Object, "&Line", [setForLine], &Ellipse, [setForEllipse], &Box, [setForBox]
    menu #1, &Color, &Red, [colorRed], &Yellow, [colorYellow], &Green, [colorGreen], &Blue, [colorBlue]
    menu #1, &Drawing, "&Line Thickness", [lineThickness], "&Print", [printIt]

    bmpbutton #1, "bmp\redbttn.bmp", [colorRed], UL, 5, 5
    bmpbutton #1, "bmp\yllwbttn.bmp", [colorYellow], UL, 40, 5
    bmpbutton #1, "bmp\grnbttn.bmp", [colorGreen], UL, 75, 5
    bmpbutton #1, "bmp\bluebttn.bmp", [colorBlue], UL, 110, 5
    bmpbutton #1, "bmp\panbttn.bmp", [setForPan], UR, 110, 5
    bmpbutton #1, "bmp\circbttn.bmp", [setForEllipse], UR, 40, 5
    bmpbutton #1, "bmp\sqrbttn.bmp", [setForBox], UR, 5, 5
    bmpbutton #1, "bmp\linebttn.bmp", [setForLine], UR, 75, 5

    graphicbox #1.graph, 5, 37, 300, 200

    WindowWidth = 312
    WindowHeight = 282

    open "Liberty Draw" for graphics_nsb_nf as #1
    print #1, "trapclose [quit]"
    print #1, "fill lightgray ; flush"
    print #1.graph, "when rightButtonUp [cls]"
    print #1.graph, "down"
    print #1.graph, "color black"
    goto [setForLine]

[inputLoop]
    scan
    goto [inputLoop]

[startDraw]
    startX = MouseX
    startY = MouseY
    print #1.graph, "place "; startX; " "; startY
    goto [inputLoop]

[firstLine]
    print #1.graph, "when leftButtonMove [trackLine]"
    print #1.graph, "line "; startX; " "; startY; " "; MouseX; " "; MouseY
    oMouseY = MouseY
    oMouseX = MouseX
    goto [inputLoop]

[firstFrame]
    print #1.graph, "when leftButtonMove [trackBox]"
    print #1.graph, "box "; MouseX; " "; MouseY
    oMouseY = MouseY
    oMouseX = MouseX
    goto [inputLoop]

[trackBox]
    print #1.graph, "color white"
    print #1.graph, "box "; oMouseX; " "; oMouseY
    print #1.graph, "color black"
    print #1.graph, "place "; startX; " "; startY
    print #1.graph, "box "; MouseX; " "; MouseY
    oMouseY = MouseY
    oMouseX = MouseX
    goto [inputLoop]

[trackLine]
    print #1.graph, "color white"
    print #1.graph, "line "; startX; " "; startY; " "; oMouseX; " "; oMouseY
    print #1.graph, "color black"
    print #1.graph, "place "; startX; " "; startY
    print #1.graph, "line "; startX; " "; startY; " "; MouseX; " "; MouseY
    oMouseY = MouseY
    oMouseX = MouseX
    goto [inputLoop]

[finishLine]
    print #1.graph, "when leftButtonMove [firstLine]"
    print #1.graph, "discard"
    print #1.graph, "line "; startX; " "; startY; " "; MouseX; " "; MouseY
    print #1.graph, "flush ; redraw"
    goto [inputLoop]

[finishBox]
    print #1.graph, "when leftButtonMove [firstFrame]"
    print #1.graph, "discard"
    print #1.graph, "boxfilled "; MouseX; " "; MouseY
    print #1.graph, "flush ; redraw"
    goto [inputLoop]

[finishEllipse]
    print #1.graph, "when leftButtonMove [firstFrame]"
    print #1.graph, "discard"
    print #1.graph, "place "; int((startX+MouseX)/2); " ";  int((startY+MouseY)/2)
    print #1.graph, "ellipsefilled "; abs(MouseX-startX); " "; abs(MouseY-startY)
    print #1.graph, "flush ; redraw"
    goto [inputLoop]

[cls]
    print #1.graph, "cls"
    goto [inputLoop]


[setForLine]

    print #1.graph, "when leftButtonDown [startDraw]"
    print #1.graph, "when leftButtonMove [firstLine]"
    print #1.graph, "when leftButtonUp [finishLine]"
    goto [inputLoop]

[setForBox]

    print #1.graph, "when leftButtonDown [startDraw]"
    print #1.graph, "when leftButtonMove [firstFrame]"
    print #1.graph, "when leftButtonUp [finishBox]"
    goto [inputLoop]

[setForEllipse]

    print #1.graph, "when leftButtonDown [startDraw]"
    print #1.graph, "when leftButtonMove [firstFrame]"
    print #1.graph, "when leftButtonUp [finishEllipse]"
    goto [inputLoop]

[setForPan]

    filedialog "Get *.bmp file", "bmp\*.bmp", panFile$
    if panFile$ = "" then [inputLoop]

    loadbmp "panWithMe", panFile$
    print #1.graph, "when leftButtonDown [drawBmp]"
    print #1.graph, "when leftButtonMove [drawBmp]"
    print #1.graph, "when leftButtonUp [flushBmp]"
    goto [inputLoop]

[drawBmp]

    print #1.graph, "drawbmp panWithMe "; MouseX; " "; MouseY
    goto [inputLoop]

[flushBmp]

    print #1.graph, "flush"
    goto [inputLoop]

[colorRed]

    print #1.graph, "backcolor red"
    goto [inputLoop]


[colorYellow]

    print #1.graph, "backcolor yellow"
    goto [inputLoop]


[colorGreen]

    print #1.graph, "backcolor green"
    goto [inputLoop]


[colorBlue]

    print #1.graph, "backcolor blue"
    goto [inputLoop]


[lineThickness]

    prompt "Line Thickness"; lineThickness$
    print #1.graph, "size "; lineThickness$
    goto [inputLoop]


[printIt]

    print #1.graph, "print"
    goto [inputLoop]


[quit]

    confirm "Are you sure?"; answer$
    if answer$ = "no" then [inputLoop]
    close #1
    end
