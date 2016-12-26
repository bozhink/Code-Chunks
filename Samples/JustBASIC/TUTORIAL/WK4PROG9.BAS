
    'WK4PROG9.BAS
    'demonstrate printing to statictext control

    statictext #countdown.stext, "Counting down:", 10, 10, 200, 25
    open "Countdown" for window as #countdown

    for count = 10 to 1 step -1
        print #countdown.stext, "Counting down: "; count
        t$ = time$()
        while t$ = time$()
        wend
    next count

    print #countdown.stext, "Counting Down: Done."

    end
