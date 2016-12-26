
    ' This is a simple Rolodex application

    ' In this demo we touch upon adding buttons to a text window,
    ' sequential file i/o, and more

    ' do not open a main window
    nomainwin

    dim cards$(1000) ' set up one hundred rolodex cards

    gosub [loadCards]

    if cardLimit = 0 then cards$(0) = "Shoptalk Systems" + chr$(13) + "http://www.libertybasic.com" + chr$(13) : cardLimit = 1

    cardNumber = 0
    WindowWidth = 225
    WindowHeight = 226

    bmpbutton #rolo, "bmp\lbttn.bmp", [previous], UL, 5, 3
    bmpbutton #rolo, "bmp\rbttn.bmp", [next], UL, 34, 3
    bmpbutton #rolo, "bmp\addbttn.bmp", [add], UL, 63, 3
    bmpbutton #rolo, "bmp\lensbttn.bmp", [find], UL, 92, 3
    bmpbutton #rolo, "bmp\xoutbttn.bmp", [del], UL, 121, 3
    bmpbutton #rolo, "bmp\tohdrive.bmp", [save], UL, 150, 3
    texteditor #rolo.text, 5, 32, 213, 150
    open "Liberty Rolodex" for window_nf as #rolo

    print #rolo, "trapclose [quit]"
    print #rolo.text, cards$(cardNumber) ;

[mainLoop]
    'wait for user input
    wait

[loadCards]

    cardLimit = 0

    'return now if file does not exist
    dim info$(10,3)
    files "", "rolodeck.dat", info$()
    if val(info$(0, 0)) = 0 then return

    open "rolodeck.dat" for input as #file

    while eof(#file) = 0 and cardLimit < 100 and line$ <> "EOF"
        card$ = ""
        line$ = ""
        while line$ <> "EOC"  and line$ <> "EOF"   ' End Of Card
            line input #file, line$
            if line$ <> "EOC" then card$ = card$ + line$ + chr$(13)
        wend
        if line$ <> "EOF" then cards$(cardLimit) = card$  : cardLimit = cardLimit + 1
    wend

    close #file

    return

[next]     ' >> was pressed. move foreward to the next card and display it

    if cardNumber + 1 >= cardLimit then [mainLoop]

    gosub [cardRead]

    cardNumber = cardNumber + 1
    print #rolo.text, "!cls";
    print #rolo.text, cards$(cardNumber);

    goto [mainLoop]

[previous]      ' << was pressed. back up to the previous card and display it

    if cardNumber <= 0 then [mainLoop]

    gosub [cardRead]

    cardNumber = cardNumber - 1
    print #rolo.text, "!cls";
    print #rolo.text, cards$(cardNumber);

    goto [mainLoop]

[find]     ' Find was pressed. find and display the card containing findString$

    prompt "Find what?"; findString$

    for searchIndex = 0 to cardLimit - 1
        matchIndex =  instr(cards$(searchIndex), findString$)
        if matchIndex > 0 then cardNumber = searchIndex
    next searchIndex

    print #rolo.text, "!cls";
    print #rolo.text, cards$(cardNumber);

    goto [mainLoop]

[add]     ' Add was pressed. add a new card to the end of the deck

    if cards$(cardNumber) = "" then [mainLoop]
    if cardLimit >= 99 then [mainLoop]

    cardNumber = cardLimit

    print #rolo.text, "!cls";
    print #rolo.text, "New Card."
    print #rolo.text, "Click on Save When Done."
    print #rolo.text, "!selectall";

    goto [mainLoop]

[del]     ' Del was pressed. delete the currently displayed card

    if cardNumber = cardLimit then [mainLoop]

    confirm "Delete: Are you sure?" ; answer$
    if answer$ = "no" then [mainLoop]

    for index = cardNumber + 1 to cardLimit
        cards$(index-1) = cards$(index)
    next index

    cardLimit = cardLimit - 1
    if cardNumber = cardLimit and cardNumber > 0 then cardNumber = cardNumber - 1
    if cardLimit = 0 then cardLimit = 1

    print #rolo.text, "!cls";
    print #rolo.text, cards$(cardNumber);

    goto [mainLoop]

[save]     ' Save was pressed. save the entire deck of cards

    gosub [cardRead]
    if cardNumber = cardLimit then cardLimit = cardLimit + 1

    ' save each card into rolodeck.dat ending each card with EOC
    ' and ending the file in EOF
    open "rolodeck.dat" for output as #deck

    for index = 0 to cardLimit - 1
        print #deck, cards$(index); "EOC"
    next index
    print #deck, "EOF"

    close #deck

    goto [mainLoop]

[quit]     ' close event occurred.. save the entire deck of cards

    confirm "Quit Rolodex?"; r$
    if r$ = "no" then [mainLoop]

    gosub [cardRead]
    if cardNumber = cardLimit then cardLimit = cardLimit + 1

    ' save each card into rolodeck.dat ending each card with EOC
    ' and ending the file in EOF

    print #rolo.text, "!cls";
    print #rolo.text, "Saving data...";

    open "rolodeck.dat" for output as #deck

    for index = 0 to cardLimit - 1
        print #deck, cards$(index); "EOC"
    next index
    print #deck, "EOF"

    close #deck

    close #rolo

    end

[cardRead]    ' read the contents of the window into the current card slot

    print #rolo.text, "!modified? m$";
    if m$ = "false" then return

    ' find out how many lines of text are displayed
    print #rolo.text, "!lines size";

    ' place the contents of #rolo into card$
    card$ = ""
    for index = 1 to size
        print #rolo.text, "!line "; index ;
        line input #rolo.text, line$
        card$ = card$ + line$ + chr$(13)
    next index

    ' remove extra blank lines from end of card
    while right$(card$, 2) = chr$(13) + chr$(13)
        card$ = left$(card$, len(card$) - 1)
    wend

    cards$(cardNumber) = card$

    return
