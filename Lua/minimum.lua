-- translation of minimum.cxx

w = Window{400,320}
b = Box{10,10,300,300; box=Frametype.engraved, label=
[[MINIMUM UPDATE TEST

The slider on the right purposely
draws outside it's boundaries.
Moving it should leave old copies
of the label.  These copies should
*not* be erased by any actions
other than hiding and showing
of that portion of the window
or changing the button that
intesects them.]]}


-- 
s = Slider{320,10,20,300,"Too_Big_Label"; align=0}

Button{20,270,100,30,"Button"}
Return_Button{200,270,100,30,"Button"}

w:show()
