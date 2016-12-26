
    'COMBOBOX.BAS  - a short combobox demo

    WindowWidth = 360
    WindowHeight = 270

    array$(0) = "This"
    array$(1) = "is"
    array$(2) = "a"
    array$(3) = "test"
    array$(4) = "of"
    array$(5) = "the"
    array$(6) = "emergency"
    array$(7) = "broadcast"
    array$(8) = "system"

    combobox #main.testcb, array$(), [selected], 26, 16, 136, 200
    textbox #main.index, 182, 16, 136, 25
    button #main, "Accept Selection", [accept], UL, 182, 51, 136, 25
    statictext #main.instruct, "Hey", 182, 86, 136, 200

    open "untitled" for dialog as #main

    instruct$ = "Select an item in the combobox and watch the " + _
        "number change, then change the number and hit Accept " + _
        "Selection go the other way."

    print #main.instruct, instruct$

    'wait here for input event
    wait

[selected]   'Perform action for the combobox named 'testcb'

    print #main.testcb, "selectionindex? xVar"
    print #main.index, str$(xVar)
    wait

[accept]   'Perform action for the button named 'accept'

    print #main.index, "!contents? yVar"
    print #main.testcb, "selectindex "; yVar
    wait
