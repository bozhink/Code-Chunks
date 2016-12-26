

    'WK5SOL.BAS
    'Week 5 Just BASIC Course
    'Copyright 2004 Shoptalk Systems
    'All Rights Reserved
    'Here is our solution for week 5 of our Just BASIC course
    '------------------------------------------------------------------

    'load our bitmaps
    loadbmp "letter", "letter.bmp"
    loadbmp "call", "call.bmp"
    loadbmp "brochure", "brochure.bmp"
    loadbmp "sale", "sale.bmp"

    'setup our listbox choices
    dim status$(4)
    status$(0) = "letter"
    status$(1) = "call"
    status$(2) = "brochure"
    status$(3) = "sale"

    'no main window
    nomainwin

    'size the window
    WindowWidth = 200
    WindowHeight = 150

    'setup our controls and open the window
    statictext #main, "Select Status:", 10, 10, 120, 20
    listbox #main.status, status$(, [loop], 10, 35, 120, 60
    graphicbox #main.draw, 140, 35, 34, 34
    open "Week 5 Homework" for dialog as #main
    print #main, "trapclose [quit]"

    'tell the listbox where to branch on a single-click
    print #main.status, "singleclickselect [statusSelected]"


[loop]  'wait here for user input
    input r$
    goto [loop]


[statusSelected]  'draw the icon for the selected status

    print #main.status, "selection?"
    input #main.status, selectedStatus$

    print #main.draw, "cls ; drawbmp "; selectedStatus$; " 0 0"

    goto [loop]


[quit]  'exit the program

    close #main
    end
