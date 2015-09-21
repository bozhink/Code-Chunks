-- dofile("lwin.lua")
-- dofile("lconst.lua")

-- This is a horrible example.  It will be updated.

dofile("vr3framework.lua")

establish_vr3_defaults()

function f_to_c(f) return (f - 32) * (5/9) end
function c_to_f(c) return c * (9/5) + 32 end

-- window = Window{254,180; label="Temperature converter"}
window = Window{160, 220; label="Temperature converter"}
window.resizable = window
toolbar = Pack{0, 220-16, 160, 16; type=Packtype.horizontal}

done_b = Button{0,0,32,16; label="&Done"}
function done_b:callback()
   exit(0)
end

b = Button{0,0,32,16; label="&Print"}
function b:callback() 
   print("i1.value", i1.value, "i2.value", i2.value)
   fl_alert("i1.value = " .. i1.value .. " i2.value=" .. i2.value)
end

padding = Box{0,0,1,0}

b2 = Repeat_Button{0,0, 16, 16; box=Boxtype.flat, down_box=Boxtype.thin_down,
   labeltype=Labeltype.symbol, label="@2<",
   shortcut = FL_Page_Up}
function b2:callback() print("pageup") end

b3 = Repeat_Button{0,0, 16, 16; box=Boxtype.flat, down_box=Boxtype.thin_down,
   labeltype=Labeltype.symbol, label="@2>",
   shortcut = FL_Page_Down}
function b3:callback() print("pagedown") end

toolbar.resizable = padding
toolbar:end_layout()




window:begin_layout()
-- main_pack = Pack{0,0,160,220-16; type=Fl_Pack.VERTICAL}
main_pack = Scroll{0,0,160,220-16; box=Boxtype.flat}
   

i1 = Float_Input{60,25,100,16; label="Farenheit:",  value="32.00"}
function i1:callback() 
   local v = f_to_c(self.value)
   local s = format("%.2f", v)
   i2.value = s
end

i2 = Float_Input{60, 100+25+16, 100, 16; label="Celsius:", value="0.00"}
function i2:callback() 
   local v = c_to_f(self.value)
   local s = format("%.2f", v)
   i1.value = s
end

main_pack:end_layout()

window.resizable = main_pack

window:end_layout()
window:show()


