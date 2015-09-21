-- translation of input.cxx

w = Window{400,400}

y = 0 
function next_y(n)
   local m = y
   y = y + n
   return m
end
function next_y1(n)
   local m = y1
   y1 = y1 + n
   return m
end

function cb(self)
   print("callback for "..self.label, self.value)
end

inputs = {
   Input{70,next_y(35),300,30,"Normal:"; callback=cb},
   Float_Input{70,next_y(35),300,30,"Float:"; callback=cb},
   Int_Input{70,next_y(35),300,30,"Int:"; callback=cb},
   Secret_Input{70,next_y(35),300,30,"Secret:"; callback=cb},
   Multiline_Input{70,next_y(105),300,100,"Multiline:"; callback=cb}
}

y1 = y

function next_toggle(t)
   local b = Button{10,next_y(25), 200, 25}
   b.type = Buttontype.toggle
   b.callback = toggle_cb
   for i,v in t do
      b[i] = v
   end
   return b
end

function toggle_cb(self)
   local total = 0
   for i=1,getn(toggles) do
      if toggles[i].value then
         total = total + toggles[i].flag
      end
   end
   for i=1,getn(inputs) do
      inputs[i].when = total
   end
end
   
toggles = {
   next_toggle{label="When.changed", flag=When.changed},
   next_toggle{label="When.release", flag=When.release},
   next_toggle{label="When.enter_key", flag=When.enter_key},
   next_toggle{label="When.not_changed", flag=When.not_changed},
}

y = y + 5

print_b = Button{10,y,200,25,"&print changed()"}
function print_b:callback()
   foreachi(inputs, function (_,input)
                       if input.changed then
                          input:clear_changed()
                          print(input.label, "'"..input.value.."'")
                       end
                    end)
end


function color_cb(self)
   local r,g,b = Color:get_color(self.cell)
   local ok
   ok,r,g,b = fl_color_chooser(nil, r,g,b)
   if ok then
      Color:set_color(self.cell, r,g,b)
      Fl:redraw()
      self.labelcolor = Color:contrast(Color.black, self.cell)
      self:redraw()
   end
end


color_b = Button{220,next_y1(25),100,25,"color";
   color=inputs[1].color, 
   cell=Color.white, 
   callback=color_cb}
sel_b = Button{220,next_y1(25),100,25,"selection_color";
   color=inputs[1].selection_color, 
   cell=Color.selection, 
   callback=color_cb}

textc_b = Button{220,next_y1(25),100,25,"textcolor";
   color=inputs[1].textcolor, 
   cell=Color.black, 
   callback=color_cb,
   labelcolor=Color:contrast(Color.black, inputs[1].textcolor)}

w:end_layout()
w:show()
