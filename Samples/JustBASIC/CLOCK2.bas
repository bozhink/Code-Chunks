

    'clock2.bas  - a clock program for Just BASIC v1.0

    WindowWidth = 120
    WindowHeight = 144
    nomainwin
    open "Clock" for graphics_nsb_nf as #clock
    print #clock, "trapclose [exit]"

    print #clock, "fill white"
    for angle = 0 to 330 step 30
        print #clock, "up ; home ; north ; turn "; angle
        print #clock, "go 40 ; down ; go 5"
    next angle

    print #clock, "flush"

    timer 1000, [display]
    wait

[display]  ' call this only when seconds has changed


    time$ = time$()
    hours = val(time$)
    if hours > 12 then hours = hours - 12
    minutes = val(mid$(time$, 4, 2))
    seconds = val(right$(time$, 2))

    ' delete the last drawn segment, if there is one
    if segId > 2 then print #clock, "delsegment "; segId - 1

    ' center the turtle
    print #clock, "up ; home ; down ; north"

    ' erase each hand if its position has changed
    if oldHours <> hours then print #clock, "size 2 ; color white ; turn "; oldHours * 30 + int(oldMinutes/2) ; " ; go 19 ; home ; color black ; north" : oldHours = hours
    if oldMinutes <> minutes then print #clock, "size 2 ; color white ; turn "; oldMinutes * 6 ; " ; go 38 ; home ; color black ; north" : oldMinutes = minutes
    if oldSeconds <> seconds then print #clock, "size 1 ; color white ; turn "; oldSeconds * 6 ; " ; go 38 ; home ; color black ; north" : oldSeconds = seconds

    ' redraw all three hands, second hand first
    print #clock, "size 1 ; turn "; seconds * 6 ; " ; go 38"
    print #clock, "size 2 ; home ; north ; turn "; hours * 30 + int(minutes/2); " ; go 19"
    print #clock, "home ; north ; turn "; minutes * 6 ; " ; go 38"

    ' flush to end segment, then get the next segment id #
    print #clock, "flush"
    print #clock, "segment"
    input #clock, segId

    wait

[exit]

    timer 0   'prevent timer ticks from building up
    confirm "Quit Clock?"; q$
    if q$ = "yes" then
        close #clock
    else
        timer 1000, [display]
        wait
    end if

    end
