
    'Mayhem!
    'A Just BASIC Game - Originally in Liberty BASIC
    'Copyright 1995, 2000, 2004 Carl Gundel and Steve Woodward

    'Mayhem is a game where two tanks shoot at each other in a ramdomly
    'generated landscape!   Each tank's gun is aimed by inputting an
    'angle from the horizon, and a number of pounds of TNT to propell a
    'shell with.

    'Note: There is nothing to force the players to
    'take turns while playing.


    'How to shoot
    '--------------------------------------------------------------------

    'Pick an angle from 1 to 90 degrees of the horizon and input it.
    'Then pick a quantity of pounds of TNT to use 1 - 20 (more or less)
    'and input that.  Then click on the fire button!

    'Now if you miss, give the other chap a shot at you!  And round you
    'go!!!


    'Modifying the game
    '--------------------------------------------------------------------

    'When you get bored of Mayhem, add features to make it interesting.
    'Try making it three players, or four!  Make the ground invisible
    'so that you have to hit it with a shell to 'feel' your way around it!
    'Add some cool sound effects or a dramatic musical score!
    'Try giving each player a limited number of shells, or a limited
    'quantity of TNT.  Or all of the above with a setup screen!  Use your
    'imagination, and then share your code with all of us!

    'Special thanks to Steve Woodward for inspiring me to write this game!

    dim terrain(500)

    nomainwin

    loadbmp "lefttank", "bmp\ltank.bmp"
    loadbmp "righttank", "bmp\rtank2.bmp"
    loadbmp "leftbang", "bmp\lbang.bmp"
    loadbmp "rightbang", "bmp\rbang.bmp"

    WindowWidth = 500
    WindowHeight = 435
    UpperLeftX = 10
    UpperLeftY = 10

    menu #mayhem, "&Game", "&New Game", [newGame], "&About Mayhem!", [aboutMayhem], "&Exit", [exit]
    statictext #mayhem.statictext1, "Angle", 22, 336, 40, 20
    textbox #mayhem.angleUsa, 70, 331, 100, 25
    statictext #mayhem.statictext3, "TNT", 22, 366, 26, 20
    textbox #mayhem.tntUsa, 70, 361, 45, 25
    button #mayhem, "Fire!", [fireUsa], UL, 120, 361
    statictext #mayhem.statictext2, "Angle", 322, 336, 40, 20
    textbox #mayhem.angleUssr, 370, 331, 100, 25
    statictext #mayhem.statictext4, "TNT", 322, 366, 26, 20
    textbox #mayhem.tntUssr, 370, 361, 45, 25
    button #mayhem, "Fire!", [fireUssr], UL, 420, 361
    graphicbox #mayhem.graphics, 0, 0, 494, 330
    open "Mayhem!" for window_nf as #mayhem
    print #mayhem.angleUsa, "!setfocus"
    print #mayhem, "trapclose [exit]"


[newGame]

    rate1 = rnd(1) / (rnd(1) * 20 + 10)
    rate2 = rnd(1) / (rnd(1) * 6 + 10)
    windspeed = int(rnd(1) * 50) - 25
    usaX = int(rnd(1) * 100) + 25
    ussrX = int(rnd(1) * 100) + 350

    print #mayhem.graphics, "cls ; fill cyan ; down ; color brown ; size 2"

    for x = 0 to 499 step 2
        holder1 = holder1 + rate1
        holder2 = holder2 + rate2
        holder3 = holder3 + sin(holder2) / 20
        y = 200 + int(sin(holder1) * 75) + int(cos(holder2) * 30) + int(cos(holder3) * 10)
        terrain(x) = y : terrain(x + 1) = y
        print #mayhem.graphics, "line "; x; " "; y; " "; x; " 410"
    next x

    print #mayhem.graphics, "drawbmp lefttank "; usaX - 16; " "; terrain(usaX) - 24;
    for x = usaX - 17 to usaX + 17 : terrain(x) = terrain(usaX) - 8 : next x

    print #mayhem.graphics, "drawbmp righttank "; ussrX - 16; " "; terrain(ussrX) - 24;
    for x = ussrX - 17 to ussrX + 17 : terrain(x) = terrain(ussrX) - 8 : next x

    print #mayhem.graphics, "place 10 15"

    print #mayhem.graphics, "color black ; backcolor cyan"
    if windspeed < 0 then print #mayhem.graphics, "\Wind <<"; abs(windspeed); "<<"
    if windspeed = 0 then print #mayhem.graphics, "\Wind <<0>>"
    if windspeed > 0 then print #mayhem.graphics, "\Wind >>"; windspeed; ">>"


    print #mayhem.graphics, "flush"
    print #mayhem.graphics, "segment" : input #mayhem, segId

    'comment this line out for OS/2
    'if Platform$ = "Windows" then playwave "tada.wav"


[main.inputLoop]   'wait here for input event
    input aVar$
    goto [main.inputLoop]


[fireUsa]   'the USA fires its gun!


    print #mayhem.angleUsa, "!contents?" : input #mayhem.angleUsa, angle
    print #mayhem.tntUsa, "!contents?" : input #mayhem.tntUsa, tnt
    if tnt <= 1 then
        notice "What are you kidding?  Put more tnt in there unless you wanna blow yourself up!"
        goto [main.inputLoop]
    end if

    direction = 1
    x = usaX
    y = terrain(x) - 16

    goto [trackShell]




[fireUssr]   'the USSR fires its gun!

    print #mayhem.angleUssr, "!contents?" : input #mayhem.angleUssr, angle
    print #mayhem.tntUssr, "!contents?" : input #mayhem.tntUssr, tnt
    if tnt <= 1 then
        notice "What are you kidding?  Put more tnt in there unless you wanna blow yourself up (how do you say this in Russian?)!"
        goto [main.inputLoop]
    end if

    direction = -1
    x = ussrX
    y = terrain(x) - 16

    goto [trackShell]





[trackShell]

    live = 1
    explode = 0
    tnt = tnt * 100
    windEffect = windspeed / 50
    angleXform = angle / 180 * 3.14
    xVelocity = (cos(angleXform) * tnt + 0.001) * direction
    yVelocity = sin(angleXform) * tnt + 0.001
    adjust = 3 / yVelocity
    if abs(xVelocity) > yVelocity then adjust = 3 / xVelocity * direction
    xVelocity = xVelocity * adjust * 2
    yVelocity = yVelocity * adjust * 2
    lastX = 0 : lastY = 0
    print #mayhem.graphics, "rule xor"
    while live = 1
        gosub [waitIfNeeded]
        x = x + xVelocity + windEffect
        y = y - yVelocity
        yVelocity = yVelocity - (32 * adjust)
        print #mayhem.graphics, "place "; x; " "; y
        print #mayhem.graphics, "go 1"
        if lastX = 0 then [firstTimeUsa]
        print #mayhem.graphics, "place "; lastX; " "; lastY
        print #mayhem.graphics, "go 1"
      [firstTimeUsa]
        lastX = x : lastY = y
        if x < 1 or x > 499 then live = 0
        if x < 0 then x = 0
        if x > 500 then x = 500
        if live = 1 and y >= terrain(int(x)) then live = 0 : explode = 1
    wend

    print #mayhem.graphics, "discard ; flush"

    if explode = 0 then gosub [setFocus] : goto [main.inputLoop]

    explodeX = x
    explodeY = y
    gosub [explosion]

    gosub [setFocus]

    if x >= usaX - 17 and x <= usaX + 17 then [explodeUsa]
    if x >= ussrX - 17 and x <= ussrX + 17 then [explodeUssr]

    goto [main.inputLoop]


[setFocus]   'set the appropriate user's focus

    if direction < 1 then
        print #mayhem.angleUsa, "!setfocus"
      else
        print #mayhem.angleUssr, "!setfocus"
    end if
    return


[waitIfNeeded]  'keep the game from running too fast on fast machines

    if tnt = 0 then tnt = 1
    newTime = time$("milliseconds")
    while newTime < oldTime + (30/(tnt/1000))
        newTime = time$("milliseconds")
    wend
    oldTime = newTime
    return

[explosion]   'Make an explosion at explodeX explodeY

    explodeRate = 2
    explodeSpeed = explodeRate * 100

    if hit = 0 then print #mayhem.graphics, "rule xor"
    print #mayhem.graphics, "size "; explodeRate
    print #mayhem.graphics, "place "; explodeX; " "; explodeY

    if hit = 1 then explodeSize = 42 else explodeSize = 18

    print #mayhem.graphics, "circle "; 6 - explodeRate
    for radius =  6 to explodeSize step explodeRate
        print #mayhem.graphics, "circle "; radius
        call pause
        print #mayhem.graphics, "circle "; radius - explodeRate
    next radius
    print #mayhem.graphics, "circle "; explodeSize
    print #mayhem.graphics, "rule over"

    print #mayhem.graphics, "discard"

    return


sub pause    'pause for a tenth of a second

    start = time$("ms")
    while start + 20 > time$("ms")
    wend

end sub


[explodeUsa]  'blow up the Usa tank

    print #mayhem.graphics, "drawbmp leftbang "; usaX - 16; " "; terrain(usaX) - 16
    print #mayhem.graphics, "delsegment "; segId
    now$ = time$() : while time$() = now$ : wend
    notice "USSR wins this round!"
    goto [newGame]


[explodeUssr]  'blow up the Ussr tank

    print #mayhem.graphics, "drawbmp rightbang "; ussrX - 16; " "; terrain(ussrX) - 16
    print #mayhem.graphics, "delsegment "; segId
    now$ = time$() : while time$() = now$ : wend
    notice "USA wins this round!"
    goto [newGame]


[aboutMayhem]  'Display an "About Mayhem!" dialog box

    WindowWidth = 336
    WindowHeight = 150

    statictext #main.statictext1, "Mayhem! is a game written in Liberty", 14, 16, 288, 20
    statictext #main.statictext2, "BASIC and is copyright Carl Gundel and", 14, 36, 304, 20
    statictext #main.statictext3, "Steve Woodward, 1995.", 14, 56, 168, 20
    button #main, "OK", [aboutOK], UL, 214, 76
    open "About Mayhem!" for dialog as #main
    print #main, "trapclose [aboutOK]"

    goto [main.inputLoop]


[aboutOK]   'Perform action for the button named 'aboutOK'

    close #main

    goto [main.inputLoop]



[exit]  'Quit Mayhem!

    confirm "Are you sure you want to exit?  We still have all this ammo!"; answer$
    if answer$ <> "yes" then [main.inputLoop]

    close #mayhem
    end
