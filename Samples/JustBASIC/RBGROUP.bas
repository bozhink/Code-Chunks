

    WindowWidth = 272
    WindowHeight = 200

    groupbox #main, "", 26, 16, 100, 100
    groupbox #main, "", 134, 16, 104, 100
    radiobutton #main.radiobutton2, "one", [radiobutton2Set], [radiobutton2Reset], 46, 36, 40, 20
    radiobutton #main.radiobutton3, "two", [radiobutton3Set], [radiobutton3Reset], 46, 56, 40, 20
    radiobutton #main.radiobutton4, "three", [radiobutton4Set], [radiobutton4Reset], 46, 76, 56, 20
    radiobutton #main.radiobutton6, "eh?", [radiobutton6Set], [radiobutton6Reset], 150, 36, 40, 20
    radiobutton #main.radiobutton7, "bee", [radiobutton7Set], [radiobutton7Reset], 150, 56, 40, 20
    radiobutton #main.radiobutton8, "see", [radiobutton8Set], [radiobutton8Reset], 150, 76, 40, 20
    button #main.button9, "Accept", [button9Click], UL, 198, 136, 58, 25
    open "untitled" for dialog as #main


[main.inputLoop]   'wait here for input event
    input aVar$
    goto [main.inputLoop]



[radiobutton2Set]   'Perform action for the radiobutton named 'radiobutton2'

    notice "one - Insert your own code here"

    goto [main.inputLoop]


[radiobutton2Reset]   'Perform action for the radiobutton named 'radiobutton2'

    'Insert your own code here

    goto [main.inputLoop]


[radiobutton3Set]   'Perform action for the radiobutton named 'radiobutton3'

    'Insert your own code here

    goto [main.inputLoop]


[radiobutton3Reset]   'Perform action for the radiobutton named 'radiobutton3'


    goto [main.inputLoop]


[radiobutton4Set]   'Perform action for the radiobutton named 'radiobutton4'



    goto [main.inputLoop]


[radiobutton4Reset]   'Perform action for the radiobutton named 'radiobutton4'

    'Insert your own code here

    goto [main.inputLoop]


[radiobutton6Set]   'Perform action for the radiobutton named 'radiobutton6'

    notice "eh? - Insert your own code here"

    goto [main.inputLoop]


[radiobutton6Reset]   'Perform action for the radiobutton named 'radiobutton6'

    'Insert your own code here

    goto [main.inputLoop]


[radiobutton7Set]   'Perform action for the radiobutton named 'radiobutton7'

    'Insert your own code here

    goto [main.inputLoop]


[radiobutton7Reset]   'Perform action for the radiobutton named 'radiobutton7'

    'Insert your own code here

    goto [main.inputLoop]


[radiobutton8Set]   'Perform action for the radiobutton named 'radiobutton8'

    'Insert your own code here

    goto [main.inputLoop]


[radiobutton8Reset]   'Perform action for the radiobutton named 'radiobutton8'

    'Insert your own code here

    goto [main.inputLoop]


[button9Click]   'Perform action for the button named 'button9'

    'Insert your own code here

    goto [main.inputLoop]

