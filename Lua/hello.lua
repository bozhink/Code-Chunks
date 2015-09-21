#!/usr/bin/env flua 

-- hello.cxx from the FLTK tutorial in Lua.

-- Create a window

window = Window{300,180}

-- and a box with the "Hello, World!" string in it: 

box = Box{20,40,260,100,"Hello, World!"}

-- Next, we set the type of box and the size, font, and style of the label: 

box.box = Boxtype.up
box.labelsize = 36
box.labelfont = Font.bold + Font.italic
box.labeltype = Labeltype.shadow

-- Of course, that's the C++ way.  The Lua way:

-- box = Box{20,40,260,100,"Hello, World!";
--    box=Boxtype.up, labelsize=36, labelfont=Font.bold+Font.italic,
--   labeltype=Labeltype.shadow}

-- Finally, we show the window and enter the FLTK event loop: 

window:end_layout() -- ends the layout of the window
window:show()

-- The resulting program will display the window below. You can quit
-- the program by closing the window or pressing the ESCape key.
