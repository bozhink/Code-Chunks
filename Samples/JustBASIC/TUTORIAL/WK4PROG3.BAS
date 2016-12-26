
    'WK4PROG3.BAS
    'open a window with a button
    'the window is sized at 399 by 100 at position 200, 150
    WindowWidth = 300
    WindowHeight = 100
    UpperLeftX = 200
    UpperLeftY = 150
    button #myFirst.ok, "OK!", [okClicked], UL, 15, 15
    open "myname's first window!" for window as #myFirst

    'now stop and wait
    input aVar$
    goto [quit]

[okClicked]  'the OK! button was clicked

    notice "You clicked on OK!"

[quit]
    'now close the window
    close #myFirst

    end
