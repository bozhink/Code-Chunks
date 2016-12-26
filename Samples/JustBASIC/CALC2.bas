
    'CALC2.BAS - calculator
    'Requires Just BASIC v1.0 or better

    'no main window
    nomainwin

    menu #calc, "&About Calc", "Calc &Info", [info]
    button #calc, " 0 ", [button0], LL, 5, -12
    button #calc, " . ", [buttonPoint], LL, 40, -12
    button #calc, " = ", [buttonEquals], LL, 75, -12
    button #calc, "CLR", [buttonClear], LL, 110, -12
    button #calc, " 1 ", [button1], LL, 5, 16
    button #calc, " 2 ", [button2], LL, 40, 16
    button #calc, " 3 ", [button3], LL, 75, 16
    button #calc, " / ", [buttonDivide], LL, 110, 16
    button #calc, " 4 ", [button4], LL, 5, 44
    button #calc, " 5 ", [button5], LL, 40, 44
    button #calc, " 6 ", [button6], LL, 75, 44
    button #calc, " X ", [buttonMultiply], LL, 110, 44
    button #calc, " 7 ", [button7], LL, 5, 72
    button #calc, " 8 ", [button8], LL, 40, 72
    button #calc, " 9 ", [button9], LL, 75, 72
    button #calc, " - ", [buttonSubtract], LL, 110, 72
    button #calc, " + ", [buttonAdd], LL, 110, 100
    WindowWidth = 150
    WindowHeight = 280
    open "Calculator" for graphics_nsb_nf as #calc
    print #calc, "font helv 12"

    ' set display$ up as two spaces
    display$ = "? "
    ' set up a shortcut for printing the entry line only
    blanks$ = "\"+chr$(13)+" "


    ' wait for a button to be pressed
    wait


[display]  ' update the entire display

    buffer$ = chr$(13)
    for i = 6 to 2 step -2
        buffer$ = buffer$ + " " + word$(lines$, i - 1) + " " + word$(lines$, i) + "                 " + chr$(13)
    next i
    print #calc, "cls"
    print #calc, "\" + buffer$ + "                   "
    gosub [displayEntry]
    print #calc, "flush"

  return


[displayEntry]  ' display the current entry line only

    print #calc, "place 0 0"
    print #calc, blanks$ + display$
    print #calc, "flush"

  return


[button0]  ' 0 was pressed

    display$ = display$ + "0"
    gosub [displayEntry]
    wait

[button1]  ' 1 was pressed

    display$ = display$ + "1"
    gosub [displayEntry]
    wait

[button2]  ' 2 was pressed

    display$ = display$ + "2"
    gosub [displayEntry]
    wait

[button3]  ' 3 was pressed

    display$ = display$ + "3"
    gosub [displayEntry]
    wait

[button4]  ' 4 was pressed

    display$ = display$ + "4"
    gosub [displayEntry]
    wait

[button5]  ' 5 was pressed

    display$ = display$ + "5"
    gosub [displayEntry]
    wait

[button6]  ' 6 was pressed

    display$ = display$ + "6"
    gosub [displayEntry]
    wait

[button7]  ' 7 was pressed

    display$ = display$ + "7"
    gosub [displayEntry]
    wait

[button8]  ' 8 was pressed

    display$ = display$ + "8"
    gosub [displayEntry]
    wait

[button9]  ' 9 was pressed

    display$ = display$ + "9"
    gosub [displayEntry]
    wait


[buttonPoint]  ' the decimal point button was pressed

    ' only allow one decimal point per entry
    if instr(display$, ".") > 0 then wait

    display$ = display$ + "."
    gosub [displayEntry]
    wait


[buttonClear]  ' the CLR button was pressed, clear the entry

    display$ = "? "
    gosub [display]
    wait


[buttonAdd]  ' the + button was pressed

    if len(display$) = 2 then display$ = "+ " : gosub [displayEntry] : wait
    gosub [resolvePending]
    display$ = "+ "
    gosub [display]
    wait


[buttonSubtract]  ' the - button was pressed

    if len(display$) = 2 then display$ = "- " : gosub [displayEntry] : wait
    gosub [resolvePending]
    display$ = "- "
    gosub [display]
    wait


[buttonMultiply]  ' the X button was pressed

    if len(display$) = 2 then display$ = "X " : gosub [displayEntry] : wait
    gosub [resolvePending]
    display$ = "X "
    gosub [display]
    wait


[buttonDivide]

    if len(display$) = 2 then display$ = "/ " : gosub [displayEntry] : wait
    gosub [resolvePending]
    display$ = "/ "
    gosub [display]
    wait


[buttonEquals]  ' the = button was pressed

    if len(display$) = 2 then display$ = "= " : gosub [displayEntry] : wait
    gosub [resolvePending]
    display$ = "? "
    gosub [display]
    wait


[resolvePending]

    'take the bottom-most two items and perform the appropriate
    'operation (if any)

    first = val(word$(lines$, 2))
    second = val(word$(display$, 2))
    op$ = left$(display$, 1)

    lines$ = display$ + " " + lines$

    if op$ = "+" then lines$ = "= " + str$(first + second) + " " + lines$ : return
    if op$ = "-" then lines$ = "= " + str$(first - second) + " " + lines$ : return
    if op$ = "X" then lines$ = "= " + str$(first * second) + " " + lines$ : return
    if op$ = "/" then lines$ = "= " + str$(first / second) + " " + lines$ : return
    if op$ = "=" or op$ = "?" then lines$ = "= " + str$(second) + " " + lines$ : return

  return

[info]

    notice "About Calc"  + chr$(13) + "Calc, a Just BASIC Application"
    wait

