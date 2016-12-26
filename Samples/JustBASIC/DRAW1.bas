
    nomainwin

    lineThickness$ = "1"

    menu #1, &Object, "&Line", [setForLine], &Ellipse, [setForEllipse], &Box, [setForBox]
    menu #1, &Color, &Red, [colorRed], &Yellow, [colorYellow], &Green, [colorGreen], &Blue, [colorBlue]
    menu #1, &Drawing, "&Line Thickness", [lineThickness], "&Print", [printIt]

    bmpbutton #1, "bmp\redbttn.bmp", [colorRed], UL, 5, 5
    bmpbutton #1, "bmp\yllwbttn.bmp", [colorYellow], UL, 40, 5
    bmpbutton #1, "bmp\grnbttn.bmp", [colorGreen], UL, 75, 5
    bmpbutton #1, "bmp\bluebttn.bmp", [colorBlue], UL, 110, 5
    bmpbutton #1, "bmp\circbttn.bmp", [setForEllipse], UR, 40, 5
    bmpbutton #1, "bmp\sqrbttn.bmp", [setForBox], UR, 5, 5
    bmpbutton #1, "bmp\linebttn.bmp", [setForLine], UR, 75, 5

    open "Liberty Draw" for graphics_nsb as #1
    print #1, "when leftButtonDown [startDraw]"
    print #1, "when rightButtonUp [cls]"
    print #1, "down"
    print #1, "color black"
    goto [setForLine]

[inputLoop]
    input r$
    goto [inputLoop]

[startDraw]
    startX = MouseX
    startY = MouseY
    print #1, "place "; startX; " "; startY
    goto [inputLoop]

[firstLine]
    print #1, "when leftButtonMove [trackLine]"
    print #1, "line "; startX; " "; startY; " "; MouseX; " "; MouseY
    oMouseY = MouseY
    oMouseX = MouseX
    goto [inputLoop]

[firstFrame]
    print #1, "when leftButtonMove [trackBox]"
    print #1, "box "; MouseX; " "; MouseY
    oMouseY = MouseY
    oMouseX = MouseX
    goto [inputLoop]

[trackBox]
    print #1, "color white"
    print #1, "box "; oMouseX; " "; oMouseY
    print #1, "color black"
    print #1, "place "; startX; " "; startY
    print #1, "box "; MouseX; " "; MouseY
    oMouseY = MouseY
    oMouseX = MouseX
    goto [inputLoop]

[trackLine]
    print #1, "color white"
    print #1, "line "; startX; " "; startY; " "; oMouseX; " "; oMouseY
    print #1, "color black"
    print #1, "place "; startX; " "; startY
    print #1, "line "; startX; " "; startY; " "; MouseX; " "; MouseY
    oMouseY = MouseY
    oMouseX = MouseX
    goto [inputLoop]

[finishLine]
    print #1, "when leftButtonMove [firstLine]"
    print #1, "discard"
    print #1, "line "; startX; " "; startY; " "; MouseX; " "; MouseY
    print #1, "flush ; redraw"
    goto [inputLoop]

[finishBox]
    print #1, "when leftButtonMove [firstFrame]"
    print #1, "discard"
    print #1, "boxfilled "; MouseX; " "; MouseY
    print #1, "flush ; redraw"
    goto [inputLoop]

[finishEllipse]
    print #1, "when leftButtonMove [firstFrame]"
    print #1, "discard"
    print #1, "place "; int((startX+MouseX)/2); " ";  int((startY+MouseY)/2)
    print #1, "ellipsefilled "; abs(MouseX-startX); " "; abs(MouseY-startY)
    print #1, "flush ; redraw"
    goto [inputLoop]

[cls]
    print #1, "cls"
    goto [inputLoop]


[setForLine]

    print #1, "when leftButtonMove [firstLine]"
    print #1, "when leftButtonUp [finishLine]"
    goto [inputLoop]

[setForBox]

    print #1, "when leftButtonMove [firstFrame]"
    print #1, "when leftButtonUp [finishBox]"
    goto [inputLoop]

[setForEllipse]

    print #1, "when leftButtonMove [firstFrame]"
    print #1, "when leftButtonUp [finishEllipse]"
    goto [inputLoop]


[colorRed]

    print #1, "backcolor red"
    goto [inputLoop]


[colorYellow]

    print #1, "backcolor yellow"
    goto [inputLoop]


[colorGreen]

    print #1, "backcolor green"
    goto [inputLoop]


[colorBlue]

    print #1, "backcolor blue"
    goto [inputLoop]


[lineThickness]

    prompt "Line Thickness"; lineThickness$
    print #1, "size "; lineThickness$
    goto [inputLoop]


[printIt]

    print #1, "print"
    goto [inputLoop]
