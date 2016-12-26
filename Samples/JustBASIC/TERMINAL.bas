

    'TERMINAL.BAS   -  A Liberty BASIC comms example
    'This program is to demonstrate the use of a communications port in Liberty
    'BASIC and is in no way intended to be useful for anything else.

    'Notes:
    '#comm is the handle for our comm port (we are using com1.  Change it if your modem
    '      is not on com1.

    '#window is the handle for our window

    '#window.te is the handle for our texteditor.  To display on-screen, we print to this

    '#window.gb is the handle for our graphicbox.  This object is outside the borders of
    '      our window so that it is hidden, and this is where we get the user keystrokes

    'Also, we use lof(#comm) to find out how many characters are waiting to be read from
    '      the com port, and we read those characters using the input$() function.

    nomainwin

    WindowWidth = 400
    WindowHeight = 300
    texteditor #window.te, 0, 0, 391, 254     'The handle for our texteditor is #window.te
    graphicbox #window.gb, 800, 1, 10, 10
    open "kb" for window as #window           'The handle for our window is #window
    print #window.gb, "when characterInput [getChar]"   'When the user presses a key go to [getChar]
    print #window, "trapclose [quit]"    'When the user closes our terminal window, go to [quit]
    print #window.te, "!autoresize";   'Tell the texteditor to resize with the terminal window
    print #window, "font courier_new 9";

    'Set the size of the communications buffer to 16K
    Com = 8192 * 2

    'Open communications port 1.  It's handle is #comm.
    'If you need to change to com 1, this is the line to modify
    open "COM1:9600,n,8,1,ds0,cs0,rs" for random as #comm

    prompt "Type a phone # or Enter to skip dialing."; phone$
    if phone$="" then [loop]

    'Reset the modem, wait 3 seconds for OK
    'This next section of code sends a reset, then waits for a response
    print #comm, "ATZ"     'Send ATZ to reset the modem
    print #window.te, "Attempting to reset modem..."   'Display to screen
    counter = 0
    ok = 0
    okTime$ = time$()
    entireResponse$ = ""
    while counter < 3 and ok = 0
        if lof(#comm) > 0 then
            response$ = input$(#comm, lof(#comm))
            entireResponse$ = entireResponse$ + response$
            print #window.te, response$;
            if instr(entireResponse$, "OK") > 0 then ok = 1
        end if
        if okTime$ <> time$() then
            okTime$ = time$()
            counter = counter + 1
        end if
    wend
    if ok = 0 then
        print #window.te, "Modem is not responding.  Please check your configuration."
        print #comm, ""
        goto [loop]
    end if



    'Wait 20 seconds for CONNECT or BUSY
    'This section has similar timeout code to the reset modem section
    print #window.te, "Dialing phone.  Will wait 20 secs for CONNECT."
    print #comm, "ATDT"; phone$    'Send ATDT and phone number to dial modem
    counter = 0
    ok = 0
    okTime$ = time$()
    entireResponse$ = ""
    while counter < 20 and ok = 0
        if lof(#comm) > 0 then
            response$ = input$(#comm, lof(#comm))
            print #window.te, response$;
            entireResponse$ = entireResponse$ + response$
            if instr(entireResponse$, "CONNECT") > 0 then ok = 1
            if instr(entireResponse$, "BUSY") > 0 then ok = -1
        end if
        if okTime$ <> time$() then
            okTime$ = time$()
            counter = counter + 1
        end if
    wend
    if ok = 0 then
        print #window.te, "CONNECT TIMEOUT"
    end if
    if ok = -1 then
        print #window.te, "Phone # " + phone$ + " is busy."
    end if

    print #comm, ""


[loop]

    'This is where our program spends most of its time after a successful CONNECT

    'If we want to capture keystrokes from our graphicbox, then it always needs
    'to have the input focus.  The next line ensures that it always does.
    print #window.gb, "setfocus"

    t$ = input$(#comm, lof(#comm))    'Get com port data
    if t$ <> "" then print #window.te, t$;    'Display com port data

    scan    'Check for input events

    goto [loop]


[getChar]

    'Whenever the user presses a key, we go here to process it.

    c$ = Inkey$
    'Send the character to the com port only if it is not a special keycode
    if len(c$) = 1 then print #comm, c$;
    goto [loop]


[quit]

    close #window
    close #comm
    end
