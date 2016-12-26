
    'Lander.bas
    'written by Carl Gundel
    'Needs at least Just BASIC v1.0
    'This file is contributed to the public domain
    'At this stage it is merely a prototype.
    'Use the keys 0 through 9 to control thrust
    'Use the [ and ] keys to rotate the ship!

    'You must make a VERY gentle and level landing
    'on one of the flat areas!

    'open game window

    nomainwin
    UpperLeftX = 50
    UpperLeftY = 50
    WindowWidth = 500
    WindowHeight = 340
    dim terrain(500)
    open "Lunar Lander" for graphics_nsb as #lander
    print #lander, "when characterInput [userInput]"
    print #lander, "trapclose [quit]"

    WindowWidth = 640
    call makeSprites
    call setBackground
    print #lander, "spritexy lem 50 50"
    'print #lander, "spritescale lem 200"

[startGame] 'initialize
    print #lander, "setfocus"
    fuel = 10000
    altitude = 0
    attitude = 0
    longitude = 10
    thrust = 0
    call setHorizSpeed 8
    call setVertSpeed 0
    call gravityAccelerate
    timer 50, [timerTicked]
    startTime = time$("milliseconds")
    wait


[timerTicked]   'This is the main simulation routine!
    frames = frames + 1
    if altitude <= terrain(longitude+15) - 24 then
        call setAttitude attitude
        call applyThrust thrust, attitude
        call gravityAccelerate
        altitude = altitude + getVertSpeed()
        longitude = longitude + getHorizSpeed()
        if longitude < 0 then longitude = 0
        if longitude > 485 then longitude = 485
        print #lander, "spritexy lem "; longitude; " "; altitude
        print #lander, "drawsprites"
    else
        timer 0
        if landerCrashed(longitude, attitude) then
            notice "You crashed!"
          else
            notice "Successful landing!"
        end if
        confirm "Try again?"; answer
        if answer then [startGame] else [quit]
    end if

    wait

[quit]
    timer 0
    close #lander

    end

[userInput]

    char$ = Inkey$
    if char$ = "[" then
        attitude = attitude - 22.5
        if attitude < -0.01 then attitude = 337.5
        wait
    end if
    if char$ = "]" then
        attitude = attitude + 22.5
        if attitude > 337.51 then attitude = 0
        wait
    end if
    thrustInput = instr("0123456789", char$)
    if thrustInput then thrust = (thrustInput - 1) / 8 * 0.55 + 0.333
    wait

function landerCrashed(xPosition, attitude)

    landerCrashed = int(attitude+0.1) <> 90
    landerCrashed = landerCrashed or getVertSpeed() > 2
    landerCrashed = landerCrashed or getHorizSpeed() > 2
    landerCrashed = landerCrashed or terrain(xPosition) <> terrain(xPosition+30)
    landerCrashed = landerCrashed or terrain(xPosition) <> terrain(xPosition+15)

end function

sub makeSprites

    open "lem" for graphics as #makeSprites
    print #makeSprites, "down"
    print #makeSprites, "place 0 31 ; backColor black ; boxfilled 640 73"
    for x = 0 to 15
      y = 1
      call drawLEM x, y, 270 + x * 22.5, 2, "black"
      y = 2
      call drawLEM x, y, 270 + x * 22.5, 2, "darkgray"
      call drawLEM x, y, 270 + x * 22.5, 1, "lightgray"
      call getSprite x
    next x
    close #makeSprites
    print #lander, "addsprite lem lem0 lem1 lem2 lem3 lem4 lem5 lem6 lem7 lem8 lem9 lem10 lem11 lem12 lem13 lem14 lem15"

end sub

sub drawLEM xPosition, yPosition, uncorrectedAngle, penSize, color$
    angle = uncorrectedAngle
    print #makeSprites, "north ; color "; color$; " ; up ; turn "; angle
    print #makeSprites, "place "; (xPosition)*30+15; " "; (yPosition-1)*30+15
    print #makeSprites, "size "; penSize
    print #makeSprites, "up ; go 4 ; down ; circle 8"
    print #makeSprites, "turn 75 ; go 4 ; turn 180 ; go 4"
    print #makeSprites, "turn 30 ; go 4 ; turn 180 ; go 4 ; turn 255"
    print #makeSprites, "up ; turn 160 ; go 8"
    print #makeSprites, "down ; go 4 ; turn 110"
    print #makeSprites, "go 8 ; turn 110 ; go 4"
    print #makeSprites, "place "; (xPosition)*30+15; " "; (yPosition-1)*30+15
    print #makeSprites, "north ; up ; turn "; angle
    print #makeSprites, "go 4 ; turn 125 ; go 8 ; down ; turn 45 ; go 8"
    print #makeSprites, "place "; (xPosition)*30+15; " "; (yPosition-1)*30+15
    print #makeSprites, "north ; up ; turn "; angle
    print #makeSprites, "go 4 ; turn 235 ; go 8 ; down ; turn -45 ; go 8"

end sub

sub setBackground
    'loadbmp "stars", "bmp\stars.bmp"
    print #lander, "down ; fill black"
    call drawTerrain
    print #lander, "getbmp stars 0 0 490 315"
    print #lander, "background stars"
end sub

sub getSprite spritNum
    spriteX = spritNum * 30
    print #makeSprites, "getbmp lem"; spritNum; " "; spriteX; " 1 30 60"
end sub

sub setHorizSpeed xSpeed
    vars(0) = xSpeed
end sub

sub setVertSpeed ySpeed
    vars(1) = ySpeed
end sub

function getHorizSpeed()
    getHorizSpeed = vars(0)
end function

function getVertSpeed()
    getVertSpeed = vars(1)
end function

sub setAttitude degrees
    print #lander, "spriteimage lem lem"; int(degrees / 22.5)
end sub

sub gravityAccelerate
    call setVertSpeed getVertSpeed() + 0.3'(6/18)
end sub

sub applyThrust qtyFuel, angle
    angleXform = angle / 180 * 3.141592
    call setHorizSpeed getHorizSpeed() - (qtyFuel/2) * cos(angleXform)
    call setVertSpeed getVertSpeed() - (qtyFuel/2) * sin(angleXform)
end sub


sub drawTerrain

    rate1 = rnd(1) / (rnd(1) * 17 + 10)
    rate2 = rnd(1) / (rnd(1) * 10 + 10)
    print #lander, "down ; size 1 ; color white"

    for x = 0 to 499 step 1
        if rnd(1) < 0.015 then gosub [makeLandingZone]
        holder1 = holder1+rate1
        holder2 = holder2+rate2
        holder3 = holder3+sin(holder2)/20
        y = 200+int(sin(holder1)*50)+int(cos(holder2)*50)+int(cos(holder3)*15)
        terrain(x) = y
        print #lander, "goto "; x; " "; y
    next x
    goto [endSub]

[makeLandingZone]

    width = int((rnd(1)*4+2)/3)
    lzLimit = x + 34 * width
    if lzLimit > 499 then lzLimit = 499
    for lz = x to lzLimit
        terrain(lz) = y
        print #lander, "goto "; lz; " "; y
    next lz
    x = lz
  return

[endSub]

end sub


