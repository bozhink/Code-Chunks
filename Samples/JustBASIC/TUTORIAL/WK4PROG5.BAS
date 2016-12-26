
    'WK4PROG5.BAS
    'open a window with a button, a textbox, and a statictext
    'the window is sized at 300 by 100 at position 200, 150
    WindowWidth = 300
    WindowHeight = 100
    UpperLeftX = 200
    UpperLeftY = 150
    button #myFirst.ok, "OK!", [okClicked], UL, 220, 35
    textbox #myFirst.field, 10, 35, 200, 25
    statictext #myFirst.label, "Type some text here.", 10, 10, 150, 25
    open "myname's first window!" for window as #myFirst

    'now stop and wait
    input aVar$
    goto [quit]

[okClicked]  'OK! was clicked.  Get the contents of the entry field

    'print a command to the textbox
    print #myFirst.field, "!contents?"
    'now get the contents from the textbox
    input #myFirst.field, aString$

    'now pop up a notice saying what was in the textbox
    notice aString$

[quit]
    'now close the window
    close #myFirst

    end

