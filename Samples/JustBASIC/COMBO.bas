

    'demonstrate the use of a combobox control
    array$(0) = "the quick brown"
    array$(1) = "fox jumped over"
    array$(2) = "the lazy dog"

    WindowWidth = 400
    WindowHeight = 240
    combobox #main.combo, array$(), [noAction], 30, 61, 216, 140
    textbox #main.field, 30, 21, 216, 25
    button #main.intoCombo, ">> combobox", [intoCombo], UL, 254, 21, 128, 25
    button #main.outOfCombo, "combobox >>", [outOfCombo], UL, 254, 56, 128, 25
    open "Combobox example" for window as #main

    'wait here for input event
     wait


[noAction]   'Perform action for the combobox named 'tryme'

    'Insert your own code here
    wait

[intoCombo]   'Perform action for the button named 'intoCombo'

    print #main.field, "!contents? text$"
    print #main.combo, "!"; text$
    wait

[outOfCombo]   'Perform action for the button named 'outOfCombo'

    print #main.combo, "contents? text$"
    print #main.field, text$
    wait