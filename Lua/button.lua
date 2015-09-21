-- Translation of the buttons.cxx example

w = Window{320,65}

b1 = Button{20,20,80,25, "&Beep"}
function b1:callback()
   write(strchar(7)) flush()
end

Button{120,20,80,25, "&no op"}

b3 = Button{220,20,80,25, "E&xit"}
function b3:callback()
   exit(0)
end

w:show()
