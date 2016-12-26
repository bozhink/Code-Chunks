
    'slotmach.bas - a sample program for Liberty BASIC v1.3

    'Here is a simple slot machine demo created by Carl Gundel
    'Copyright 1997 Shoptalk Systems
    'Feel free to use this code in any Liberty BASIC project

    loadbmp "cherry", "bmp\cherry.bmp"
    loadbmp "bar", "bmp\bar.bmp"
    loadbmp "lemon", "bmp\lemon.bmp"

    'Store our bitmap names in a repeating pattern
    dim images$(57)
    for x = 1 to 55 step 3
        images$(x) = "bar"
        images$(x+1) = "cherry"
        images$(x+2) = "lemon"
    next x

    'Here is our window code
    WindowWidth = 360
    WindowHeight = 255
    graphicbox #main.gb1, 22, 61, 88, 65
    graphicbox #main.gb2, 134, 61, 88, 65
    graphicbox #main.gb3, 238, 61, 88, 65
    button #main, "Pull", [pullLever], UL, 278, 186, 56, 25
    open "Slot Machine" for window_nf as #main
    print #main, "trapclose [quit]"


[mainLoop]  'Main input loop

  input r$
  goto [mainLoop]


[pullLever]   'the user pulled the lever


    'Put your animation code in here.
    'Make sure your playwave command is asynchronous so
    'that the sound plays during the animation.

    delay = 0
    for x = 1 to 55
        print #main.gb1, "drawbmp "; images$(x); " 0 0"
        print #main.gb2, "drawbmp "; images$(x+1); " 0 0"
        print #main.gb3, "drawbmp "; images$(x+2); " 0 0"
        delay = delay + 15 'as delay gets larger, we get slower
        for y = 1 to delay : next y
    next x

    'After the animation, pick the final state of our machine.
    'By picking from 1 to 5, we make getting bar-bar-bar less likely.
    item1$ = images$(int(rnd(1)*5)+1)
    item2$ = images$(int(rnd(1)*5)+1)
    item3$ = images$(int(rnd(1)*5)+1)
    'Now draw our random selections.
    'The cls is to free Windows metafile resources.
    print #main.gb1, "cls ; drawbmp "; item1$; " 0 0"
    print #main.gb2, "cls ; drawbmp "; item2$; " 0 0"
    print #main.gb3, "cls ; drawbmp "; item3$; " 0 0"
    print #main.gb1, "flush"
    print #main.gb2, "flush"
    print #main.gb3, "flush"

    'Put some code in here to figure winnings.

    goto [mainLoop]

[quit]

    close #main
    end
