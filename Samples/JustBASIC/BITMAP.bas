
  'bitmap.bas
  'demonstrate the bitmap command for bmpbuttons
  WindowWidth = 248
  WindowHeight = 175
  nomainwin
  loadbmp "arrow", "bmp\arrwbttn.bmp"
  loadbmp "blue", "bmp\bluebttn.bmp"
  bmpbutton #main.button1, "bmp\blank4.bmp", [button1Click], UL, 22, 11
  bmpbutton #main.button2, "bmp\blank4.bmp", [button2Click], UL, 22, 46
  open "untitled" for graphics as #main
  print #main, "trapclose [quit]"
  print #main, "down ; fill white; flush"

  'wait here for input events
  wait

[button1Click]   'Perform action for the button named 'button1'
  print #main.button2, "setfocus"
  print #main.button2, "bitmap arrow"
  print #main.button1, "bitmap blue"
  wait

[button2Click]   'Perform action for the button named 'button2'
  print #main.button1, "setfocus"
  print #main.button1, "bitmap arrow"
  print #main.button2, "bitmap blue"
  wait

[quit]
  close #main
  end
