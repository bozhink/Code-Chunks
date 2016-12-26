
    'this program is useful for checking the font code for Liberty BASIC

    pick$(0) = "she sells"
    pick$(1) = "sea shells"
    pick$(2) = "by the"
    pick$(3) = "seashore"

    '** Set Window Attributes
    nomainwin
    UpperLeftX = int((DisplayWidth- 404)/2) 'Center window horizontally on screen
    UpperLeftY = int((DisplayHeight- 265)/2) 'Center window vertically on screen
    WindowWidth = 410
    WindowHeight = 450

    '** Add Window Controls
    texteditor #main.te1,  8,  8,  192,  152
    texteditor #main.te2,  208,  8,  184,  152
    textbox #main.tb1,  16,  192,  112,  24
    statictext #main.Statictext4, "Font_Name w h",  8,  168,  100,  18
    statictext #main.Statictext7, "Font_Name w h",  208,  168,  100,  18
    button #main.apply1, "Apply", [applyFont1], UL,  136,  192,  67,  24
    textbox #main.tb2,  216,  192,  112,  24
    button #main.apply2, "Apply", [applyFont2], UL,  336,  192,  56,  24

    radiobutton #main.rb1, "Radiobutton 1", [set], [clear], 16, 226, 190, 20
    radiobutton #main.rb2, "Radiobutton 2", [set], [clear], 216, 226, 190, 20

    checkbox #main.cb1, "Checkbox 1", [set], [clear], 16, 256, 190, 20
    checkbox #main.cb2, "Checkbox 2", [set], [clear], 216, 256, 190, 20

    combobox #main.combo, pick$(), [wait], 8, 280, 192, 100
    listbox #main.list, pick$(), [wait], 208, 280, 184, 100

    Menu #main, "&Edit"    '** Display window
    open "Untitled" for window as #main
    print #main, "font times_new_roman 10"
    print #main, "TRAPCLOSE [main.END]"

    print #main.te1, "Enter a font name"
    print #main.te1, "and width and height"
    print #main.te1, "in the field below"
    print #main.te1, "and click the button."
    print #main.te1, "Example:"
    print #main.te1, "courier_new 8 15"

    print #main.te2, "Enter a font name"
    print #main.te2, "and width and height"
    print #main.te2, "in the field below"
    print #main.te2, "and click the button."
    print #main.te2, "Example:"
    print #main.te2, "roman 8 15"

[wait]  'wait here for events
    wait


[main.END] 'Exit the program
    '** Confirm on exit routine
    confirm " Do you want to exit? "; ANSWER$
    if ANSWER$="no" then goto [wait]
    close #main
    END


[set]  'do nothing
    goto [wait]


[clear]  'do nothing
    goto [wait]


[applyFont1]  'Insert code for the Button called apply1

    print #main.tb1, "!contents?";
    input #main.tb1, fontName$
    print #main.te1, "!font "; fontName$;
    print #main.apply1, "!font "; fontName$;
    print #main.Statictext4, "!font "; fontName$;
    print #main.tb1, "!font "; fontName$;
    print #main.rb1, "font "; fontName$;
    print #main.cb1, "font "; fontName$;
    print #main.combo, "font "; fontName$;
    goto [wait] 'Check for more user events

[applyFont2]  'Insert code for the Button called apply2

    print #main.tb2, "!contents?";
    input #main.tb2, fontName$
    print #main.te2, "!font "; fontName$;
    print #main.apply2, "!font "; fontName$;
    print #main.Statictext7, "!font "; fontName$;
    print #main.tb2, "!font "; fontName$;
    print #main.rb2, "font "; fontName$;
    print #main.cb2, "font "; fontName$;
    print #main.list, "font "; fontName$;
    goto [wait] 'Check for more user events


