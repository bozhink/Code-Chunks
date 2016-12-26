
    WindowWidth = 376
    WindowHeight = 175

    nomainwin

    BackgroundColor$ = "darkblue"
    ForegroundColor$ = "cyan"
    TextboxColor$ = "blue"
    'other background color variables are:
    'ComboboxColor$, ListboxColor$, TexteditorColor$

    statictext #main.statictext1, "Name:", 22, 26, 40, 20
    statictext #main.statictext2, "Phone #:", 22, 56, 64, 20
    statictext #main.statictext3, "Email:", 22, 86, 48, 20
    textbox #main.textbox4, 102, 16, 248, 25
    textbox #main.textbox5, 102, 46, 248, 25
    textbox #main.textbox6, 102, 76, 248, 25
    button #main.button7, "Accept", [button7Click], UL, 294, 111, 58, 25
    open "Colors example" for dialog as #main
    print #main.textbox4, "!setfocus"    'make sure the first box has the focus

    'wait here for input event
    wait

[button7Click]   'Perform action for the button named 'button7'

    'Insert your own code here
    wait
