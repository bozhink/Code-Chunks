
    nomainwin
    dim name$(500)
    dim stage$(7)
    stage$(0) = "All"
    stage$(1) = "Initial Phone Call"
    stage$(2) = "Opening Mailer"
    stage$(3) = "Follow Up Call"
    stage$(4) = "Special Offer Mailer"
    stage$(5) = "Closing Phone Call"
    gosub [loadNames]
    gosub [openMainWindow]
    print #main.contacts, "setfocus"

[inputLoop]
    input r$
    goto [inputLoop]

[openMainWindow]

    WindowWidth = 510
    WindowHeight = 350
    'open the main window
    statictext #main, "Contacts", 10, 10, 60, 20
    listbox #main.contacts, name$(, [editName], 10, 35, 160, 120
    statictext #main, "Filter Contacts", 10, 170, 160, 20
    combobox #main.filter, stage$(, [loadNamesFiltered], 10, 190, 160, 120
    button #main, " &New ", [addName], UL, 10, 290
    texteditor #main.memo, 265, 190, 225, 90
    statictext #main, "Name", 200, 10, 60, 20
      textbox #main.name, 265, 10, 225, 25
    statictext #main, "Address", 200, 40, 60, 20
      textbox #main.addr, 265, 40, 225, 25
    statictext #main, "City", 200, 70, 60, 20
      textbox #main.city, 265, 70, 225, 25
    statictext #main, "State", 200, 100, 60, 20
      textbox #main.state, 265, 100, 40, 25
    statictext #main, "Zip",  330, 100, 40, 20
      textbox #main.zip, 380, 100, 108, 25
    statictext #main, "Phone #", 200, 130, 60, 20
      textbox #main.phone, 265, 130, 225, 25
    statictext #main, "Stage", 200, 160, 60, 20
      combobox #main.stage, stage$(, [inputLoop], 265, 160, 225, 110
    button #main, " &Accept ", [acceptEntry], UL, 420, 290
    open "Liberty Contact Manager" for dialog as #main
    print #main, "trapclose [quit]"
    print #main.filter, "select All";
    print #main.contacts, "singleclickselect"
    return

[loadNames]

    open "contact3.dat" for random as #contacts len = 650
    field #contacts, 20 as name$, 20 as address$, 15 as city$, 2 as state$, 10 as zip$, 15 as phone$, 20 as stage$, 500 as memo$, 48 as fill$
    if eof(#contacts) <> 0 then close #contacts : gosub [initializeNames] : goto [loadNames]
    get #contacts, 1
    contactCount = val(name$)
    if contactCount = 0 then close #contacts : return
    for index = 2 to contactCount + 1
        get #contacts, index
        name$(index - 1) = name$
    next index
    close #contacts
    return

[loadNamesFiltered]

    print #main.filter, "selection? filter$"
    open "contact3.dat" for random as #contacts len = 650
    field #contacts, 20 as name$, 20 as address$, 15 as city$, 2 as state$, 10 as zip$, 15 as phone$, 20 as stage$, 500 as memo$, 48 as fill$
    get #contacts, 1
    contactCount = val(name$)
    if contactCount = 0 then close #contacts : return
    for index = 2 to contactCount + 1
        get #contacts, index
        if filter$ = stage$ or filter$ = "All" then name$(index - 1) = name$ else name$(index - 1) = ""
    next index
    close #contacts
    print #main.contacts, "reload"
    goto [inputLoop]

[initializeNames]

    open "contact3.dat" for random as #contacts len = 650
    field #contacts, 20 as name$, 20 as address$, 15 as city$, 2 as state$, 10 as zip$, 15 as phone$, 20 as stage$, 500 as memo$, 48 as fill$
    name$ = "4"
    put #contacts, 1
    name$ = "Carlos Gomez"
    stage$ = "Initial Phone Call"
    put #contacts, 2
    name$ = "Raymond Rhodes"
    stage$ = "Special Offer Mailer"
    put #contacts, 3
    name$ = "Willie Weston"
    stage$ = "Initial Phone Call"
    put #contacts, 4
    name$ = "Alexi Guerra"
    stage$ = "Special Offer Mailer"
    put #contacts, 5
    close #contacts
    return

[addName]

    addName = 1
    print #main.contacts, "selectindex 0"
    print #main.name, ""
    print #main.addr, ""
    print #main.city, ""
    print #main.state, ""
    print #main.zip, ""
    print #main.phone, ""
    print #main.stage, "selectindex 7"
    print #main.memo, "!cls"
    print #main.name, "!setfocus"
    goto [inputLoop]

[getContactRecord]

    open "contact3.dat" for random as #contacts len = 650
    field #contacts, 20 as name$, 20 as address$, 15 as city$, 2 as state$, 10 as zip$, 15 as phone$, 20 as stage$, 500 as memo$, 48 as fill$
    get #contacts, recIndex + 1
    close #contacts

    return

[editName]

    addName = 0
    print #main.contacts, "selection? selection$"
    if selection$ = "" then [inputLoop]
    recIndex = 0
    for index = 1 to contactCount
        if selection$ = name$(index) then recIndex = index
    next  index
    if recIndex = 0 then [inputLoop]  'This should never need to happen
    gosub [getContactRecord]
    print #main.name, name$
    print #main.addr, address$
    print #main.city, city$
    print #main.state, state$
    print #main.zip, zip$
    print #main.phone, phone$
    print #main.stage, "selectindex 7"
    for index = 0 to 5
        if stage$(index) = stage$ then print #main.stage, "selectindex "; index + 1
    next index
    print #main.memo, "!cls" ;
    print #main.memo, memo$ ;
    goto [inputLoop]

[acceptEntry]

    print #main.name, "!contents? name$";
    print #main.addr, "!contents? address$";
    print #main.city, "!contents? city$";
    print #main.state, "!contents? state$";
    print #main.zip, "!contents? zip$";
    print #main.phone, "!contents? phone$";
    print #main.stage, "selection? stage$";
    print #main.memo, "!selectall";
    print #main.memo, "!selection? memo$";
    print #main.memo, "!cls";
    print #main.memo, memo$
    if addName = 1 then
        contactCount = contactCount + 1
        recIndex = contactCount
    end if
    name$(recIndex) = name$
    print #main.contacts, "reload"
    gosub [saveContactRecord]
    addName = 0
    goto [loadNamesFiltered]

[saveContactRecord]

    open "contact3.dat" for random as #contacts len = 650
    field #contacts, 20 as name$, 20 as address$, 15 as city$, 2 as state$, 10 as zip$, 15 as phone$, 20 as stage$, 500 as memo$, 48 as fill$
    put #contacts, recIndex + 1
    close #contacts
    if addName = 0 then return
    open "contact3.dat" for random as #contacts len = 650
    field #contacts, 20 as count$, 630 as fill$
    count$ = str$(contactCount)
    put #contacts, 1
    close #contacts
    return

[quit]

    print #main, "trapclose"
    close #main
    end

