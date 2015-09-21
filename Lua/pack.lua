-- Translation of pack.cxx

-- From the initial comments:

-- // Rather crude test of the Fl_Pack object.
-- // Changing the type() of an Fl_Pack after it is displayed is not supported
-- // so I have to do a lot of resizing of things before that.

w = Window{365,525}

scroll = Scroll{10,10,345,285}

pack = Pack{10,10,345,285; box=Frametype.down}

buttons = {}

for i = 1,24 do
   buttons[i] = Button{25+i*10,25+i*10,25,25,"b"..i}
end

pack:end_layout()

w.resizable = pack

scroll:end_layout()

function type_callback(self)
   for i = 1,getn(buttons) do
      buttons[i]:resize(0,0,25,25)
   end
   pack:resize(scroll.x,scroll.y,scroll.w,scroll.h)
   scroll:redraw()
   pack.type = self.my_packtype
   pack:redraw()
end

Light_Button{10,325,175,25,"Horizontal"; 
   type=Buttontype.radio, callback=type_callback,
   my_packtype=Packtype.horizontal}

Light_Button{10,350,175,25,"Vertical"; value=1,
   type=Buttontype.radio, callback=type_callback,
   my_packtype=Packtype.vertical}

spacing = Value_Slider{50,375,295,25,"spacing:";
   align=Align.left, type=Slidertype.horiz, 
   minimum=0, maximum = 30, step = 1}

function spacing:callback()
   pack.spacing = self.value
   scroll:redraw()
end

w:end_layout()
w:show()
