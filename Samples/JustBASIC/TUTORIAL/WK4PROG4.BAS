
    'WK4PROG4.BAS
    'open a window with a button and a textbox
    'the window is sized at 300 by 100 at position 200, 150
    WindowWidth = 300
    WindowHeight = 100
    UpperLeftX = 200
    UpperLeftY = 150
    button #myFirst.ok, "OK!", [okClicked], UL, 15, 15
    textbox #myFirst.field, 60, 15, 200, 25
    open "myname's first window!" for window as #myFirst

    'now print some text into the textbox
    print #myFirst.field, "Type some text here."

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
