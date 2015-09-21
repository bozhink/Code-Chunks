-- translation of iconize.cxx

w = Window{200,200}
w:end_layout()
w:show()

control = Window{120,120}

hide_button = Button{0,0,120,30,"hide()"}
function hide_button:callback()
   w:hide()
end

iconize_button = Button{0,30,120,30,"iconize()"}
function iconize_button:callback ()
   w:iconize()
end

show_button = Button{0,60,120,30,"show()"}
function show_button:callback ()
   w:show()
end

show_button2 = Button{0,90,120,30,"show this"}
function show_button2:callback()
   control:show()
end

function control:callback()
   exit(0)
end

control:end_layout()
control:show()
