

    loadbmp "smiley", "sprites\smiley.bmp"
    loadbmp "landscape", "sprites\bg1.bmp"
    WindowHeight = 300
    WindowWidth = 400
    graphicbox #w.g, 0, 0, 400, 300
    open "sprite test" for window_nf as #w
    print #w.g, "background landscape";
    print #w.g, "addsprite smiley smiley";
    print time$("milliseconds")
    for x = 1 to 100 step 4
      if visible = 2 then
        visible = 1
      else
        visible = 2
      end if
      print #w.g, "spritexy smiley "; x; " "; x
      print #w.g, "spritevisible smiley "; word$("on off", visible)
      print #w.g, "drawsprites";
    next x
    print time$("milliseconds")

    input a$ 

