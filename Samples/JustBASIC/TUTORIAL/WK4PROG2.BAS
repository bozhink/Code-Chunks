
    'WK4PROG2.BAS
    'open a window sized at 300 by 100 at position 200, 150
    WindowWidth = 300
    WindowHeight = 100
    UpperLeftX = 200
    UpperLeftY = 150
    open "myname's first window!" for window as #myFirst

    'now stop and wait
    input aVar$

    'now close the window
    close #myFirst

    end
