
    'SPRGETXY.BAS  - demonstrate spritexy?

    'load the bitmaps we'll use as sprites & background
    loadbmp "smiley1", "sprites\smiley1.bmp"
    loadbmp "smiley2", "sprites\smiley2.bmp"
    loadbmp "smiley3", "sprites\smiley3.bmp"
    loadbmp "smiley4", "sprites\smiley4.bmp"
    loadbmp "landscape", "sprites\bg1.bmp"

    'open a window and graphicbox
    WindowHeight = 300
    WindowWidth = 400
    graphicbox #w.g, 0, 0, 400, 300
    open "sprite test" for window_nf as #w

    'add a background and sprite
    print #w.g, "background landscape";
    print #w.g, "addsprite smiley smiley1 smiley2 smiley3 smiley4";

    'tell the sprite to cycle one frame at a time, and move x5, y5
    print #w.g, "cyclesprite smiley 1"
    print #w.g, "spritemovexy smiley 5 5"


    for x = 1 to 100
        'draw the next frame of animation
        print #w.g, "drawsprites";
        'get the x and y position of our sprite and print it out
        print #w.g, "spritexy? smiley x$ y$"
        print x$; " "; y$
    next x

    input a$ 

