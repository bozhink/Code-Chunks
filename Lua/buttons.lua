-- Translation of the buttons.cxx example

w = Window{320,130}

Button{10,10,130,30, "Button"}
Return_Button{150,10,160,30, "Return_Button"}
Repeat_Button{10,50,130,30, "Repeat_Button"}
Light_Button{10,90,130,30, "Light_Button"}
Round_Button{150,50,160,30, "Round_Button"}
Check_Button{150,90,160,30, "Check_Button"}

w:end_layout()
w:show()
