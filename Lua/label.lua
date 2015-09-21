-- Translation of label.cxx

-- The original version used some kind of silly forms-compatibility
-- stuff to flip the coordinate system.  I'm not going to repeat that,
-- so you can just cope with everything being reversed top to bottom.

flua_require("shorthand.lua")

w = Window{400,400}

input = Input{50,0,350,25; 
   value="The quick brown fox jumped over the lazy dog.", 
   when=When.changed}

function input:callback()
   text.label = self.value
   w:redraw()
end

sizes = Value_Slider{50,25,350,25,"Size:";
   type=Slidertype.horiz, align=Align.left,
   step=1, minimum=1, maximum=64,
   value=14}

function sizes:callback()
   text.labelsize = self.value
   w:redraw()
end

fonts = Value_Slider{50,50,350,25,"Font:";
   type=Slidertype.horiz, align=Align.left,
   step=1, minimum=0, maximum=15,
   value=0}

function fonts:callback()
   text.labelfont = self.value
   w:redraw()
end

function alignval(self)
   -- This is the cheap way to do it.  We know that the label is a
   -- valid entry in the Align table.  The non-cheap way is to
   -- explicitly set a value on each button at creation, like
   -- "my_align_value=Align.left" and return that instead.
   if self.value then
      return Align[self.label]
   else
      return 0
   end
end

function align_cb(self)
   local total = 0
   for i=1,getn(align_buttons) do
      local b = align_buttons[i]
      total = total + alignval(b)
   end
   text.align = total
   w:redraw()
end


-- g = Group{0,0,0,0}

align_Button = make_shorthand(Button, {callback=align_cb, type=Buttontype.toggle})

align_buttons = {
   align_Button{50,75,50,25, "left"},
   align_Button{100,75,50,25, "right"},
   align_Button{150,75,50,25, "top"},
   align_Button{200,75,50,25, "bottom"},
   align_Button{250,75,50,25, "inside"},
   align_Button{300,75,50,25, "wrap"},
   align_Button{350,75,50,25, "clip"},
}

--g.resizable=g
--g:end_layout()

function non_sym_cb(self)
   text.labeltype = self.labeltype_value
   w:redraw()
end
function sym_cb(self)
   text.labeltype = self.labeltype_value
   if strsub(text.label, 1, 1) ~= "@" then
      input.value = "@->"
      text.label = "@->"
   end
   w:redraw()
end

c = Choice{50,100,200,25, "type:"}
c:add(Menu_Entry{"normal"; labeltype_value=Labeltype.normal, 
         callback=non_sym_cb})
c:add(Menu_Entry{"symbol"; labeltype_value=Labeltype.symbol, 
         callback=sym_cb})
c:add(Menu_Entry{"shadow"; labeltype_value=Labeltype.shadow, 
         callback=non_sym_cb})
c:add(Menu_Entry{"engraved"; labeltype_value=Labeltype.engraved, 
         callback=non_sym_cb})
c:add(Menu_Entry{"embossed"; labeltype_value=Labeltype.embossed, 
         callback=non_sym_cb})
c.value = 0

text = Box{100,225,200,100; label=input.value,
   box=Boxtype.engraved, align=Align.center}

w.resizable = text
w:end_layout()
w:show()

