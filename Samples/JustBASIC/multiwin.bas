

    'multiwin.bas  - A short example that manages more than one window.
    'Notice that the main dialog window closes the entire app and so
    'does not need the same kind of fancy handling as its two subwindows.
    'This example requires Just BASIC v1.0 or better
    nomainwin  'no console window

    dim properties(10) 'use this to store global properties

    'set up global window sizing values
    UpperLeftX = 10
    UpperLeftY = 10
    WindowWidth = 304
    WindowHeight = 115

    call openBallisticDialog
    wait


[quit]
    call closeGraphWindow
    call closeTextWindow
    call closeBallisticDialog
    end

sub closeBallisticDialog
    close #ballistic
end sub

[plot]  'this code borrowed from the mayhem.bas game
    call openGraphWindow
    call openTextWindow
    x = 0
    y = groundZero()
    print #ballistic.angle, "!contents? angle"
    print #ballistic.velocity, "!contents? velocity"
    velocity = velocity * 100
    angleXform = angle / 180 * 3.14
    xVelocity = cos(angleXform) * velocity
    yVelocity = sin(angleXform) * velocity
    adjust = 3 / (yVelocity + 0.0001)
    if abs(xVelocity) > yVelocity then adjust = 3 / (xVelocity + 0.0001)
    xVelocity = xVelocity * adjust * 2
    yVelocity = yVelocity * adjust * 2
    while x < 300 and y <= groundZero()
        x = x + xVelocity
        y = y - yVelocity
        call plotTo x, y
        yVelocity = yVelocity - (32 * adjust)
    wend
    wait

sub plotTo x, y
    print #graph, "goto "; int(x); " "; int(y)
    print #text, x; ","; groundZero()-y
end sub

function groundZero()  'make a constant
    groundZero = 90
end function

sub openBallisticDialog
    statictext #ballistic, "Angle (0-89):", 8, 21, 70, 20
    textbox #ballistic.angle, 86, 16, 184, 25
    statictext #ballistic, "Velocity (0-10):", 8, 51, 70, 20
    textbox #ballistic.velocity, 86, 46, 100, 25
    button #ballistic.plot, "Plot!", [plot], UL, 222, 46, 50, 25
    open "Ballistic Plot" for dialog as #ballistic
    print #ballistic, "trapclose [quit]"
end sub

sub openGraphWindow
    if isGraphOpen() = 0 then   'only open it if it isn't open
        UpperLeftY = 130
        open "Ballistic Plot" for graphics_nsb as #graph
        print #graph, "trapclose [closeGraph]"
        print #graph, "down"
        call graphIsOpen
    else
        'I could do something here if the window is open
    end if
    print #graph, "place 0 "; groundZero()
end sub

sub openTextWindow
    if isTextOpen() = 0 then   'only open it if it isn't open
        UpperLeftY = 250
        WindowHeight = 250
        open "Ballistic Report" for text as #text
        print #text, "!trapclose [closeText]";
        call textIsOpen
    else
        'I could do something here if the window is open
    end if
    print #text, "============Report starts============="
end sub

[closeGraph]
    call closeGraphWindow
    wait

sub closeGraphWindow
    if isGraphOpen() then
        close #graph
        call graphIsClosed
    end if
end sub

[closeText]
    call closeTextWindow
    wait

sub closeTextWindow
    if isTextOpen() then
        close #text
        call textIsClosed
    end if
end sub

sub graphIsOpen    'indicate that the graph window is open
    properties(0) = 1
end sub

sub graphIsClosed    'indicate that the graph window is closed
    properties(0) = 0
end sub

sub textIsOpen    'indicate that the text window is open
    properties(1) = 1
end sub

sub textIsClosed    'indicate that the text window is closed
    properties(1) = 0
end sub

function isGraphOpen()    'is the graph window open? return zero or non-zero
    isGraphOpen = properties(0)
end function

function isTextOpen()    'is the text window open? return zero or non-zero
    isTextOpen = properties(1)
end function



