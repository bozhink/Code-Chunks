'     Title: 3 Point Circle
'Programmer: Andy Amaya
'     Date: 2005.02.24

NoMainWin
Dim p(3,1)
WindowWidth = 800
WindowHeight = 600
UpperLeftX = Int((DisplayWidth-WindowWidth)/2)
UpperLeftY = Int((DisplayHeight-WindowHeight)/2)
Open "3 Point Circle" For Graphics_nsb_nf As #g
#g "Down; TrapClose [ndit]"

[ThreePoints]
    #g,"Fill 0 32 96; Color white; BackColor 0 32 96; when rightButtonDown"
    Print text(500,565,"Left-click points on screen")
    #g,"Discard"
    numPoints = 3
    points = 0
[getPointsLoop]
    If points < numPoints Then
        #g,"when leftButtonDown [getCoords]"
        Wait
[returnHere]
        p(points,0)=mx
        p(points,1)=my
        points = points + 1
        #g,"Color white; BackColor 0 32 96"
        Print text(10,points*20," point"+Str$(points)+": ("+Str$(mx)+" , "+Str$(my)+")")
    Else
        #g,"Color white; BackColor 0 32 96"
        Print text(500,565,"(Left-click to draw the circle)")
        #g,"Discard; when leftButtonDown [drawCircle]"
        Wait
    End If
    Scan
    Goto [getPointsLoop]

[getCoords]
    mx = MouseX
    my = MouseY
    #g,"Color red; BackColor red; Place ";mx;" ";my
    #g,"CircleFilled 5"
    Goto [returnHere]

[drawCircle]
    x1 = p(0,0): y1 = p(0,1)
    x2 = p(1,0): y2 = p(1,1)
    x3 = p(2,0): y3 = p(2,1)
'===Begin parameter validation=================
    'If line segment x1,y1 to x2,y2 is vertical
    'will cause a divide by zero error when
    'calculating the slope, so swap the
    'points around to avoid the error.
    If x1 = x2 Then
        temp = x2
        x2 = x3
        x3 = temp
        temp = y2
        y2 = y3
        y3 = temp
    End If
    'Same goes for these points
    If x2 = x3 Then
        temp = x1
        x1 = x3
        x3 = temp
        temp = y1
        y1 = y3
        y3 = temp
    End If

    'ma and mb are the slopes of the lines for by x1,y1 to x2,y2
    'and x2,y2 to x3,y3 (respectively)
    ma = (y2-y1)/(x2-x1)
    mb = (y3-y2)/(x3-x2)

    If mb - ma = 0.0 Then
        'If all three points are on the same line, can't draw circle
        Print text(400,20,"Points are coincident, no circle exists!")
    Else
    'Local constants:
        pi2 = Atn(1)*8.0
        stepSize = pi2/128.0

        'Find center X coord using this formula
        cX = ( (ma*mb*(y1-y3)) + (mb*(x1+x2)) - (ma*(x2+x3)) ) / (2 * (mb-ma))
        'Show the value of center X on screen
        #g,"Color white; BackColor 0 32 96"
        Print text(10,80,"centerX = "+Str$(cX))

        'Find center Y coord using this formula
        cY = (-1.0/ma) * (cX-(x1+x2)/2.0) + ((y1+y2)/2.0)
        'Show the value of center Y on screen
        Print text(10,100,"centerY = "+Str$(cY))

        'Plot the center of the circle using green colored dot
        #g,"Color green;BackColor green;Place ";cX;" ";cY
        #g,"CircleFilled 5"

        'Since we now know the center coords just find the distance
        'from the center to any of the given coords (point x1,y1 here)
        'and this is the radius
        radius = Sqr( (cX-x1)*(cX-x1) + (cY-y1)*(cY-y1) )

        'Print radius value to the screen
        #g,"Color white; BackColor 0 32 96"
        Print text(10,120," radius = "+Str$(radius))

        'All of the necessary info is at hand so draw the circle
        #g,"Color yellow; Size 1; Place ";radius + cX;" ";cY
        For i = stepSize To pi2 Step stepSize
            nX = Cos(i)*radius + cX
            nY = Sin(i)*radius + cY
            #g,"Goto ";nX;" ";nY
        Next i
    End If

    'All done. Give user choice of repeating or exiting program
    #g,"Color 0 32 96; BackColor 0 32 96; Place 500 ";WindowHeight-55
    #g,"BoxFilled ";WindowWidth;" ";WindowHeight;"; Color white"
    Print text(500,565, "Left-click to [EXIT]     Right-click to [Repeat]")
    #g,"SetFocus; when leftButtonDown [ndit]; when rightButtonDown [ThreePoints]"
    Wait

[ndit]
Close #g
End

Function text(x,y,msg$)
    #g,"Place ";x;" ";y;";|";msg$
End Function
