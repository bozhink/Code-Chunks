-- Translated from adjuster.cxx

-- Sadly, :format() is unavailable, and Fl_Valuator.H does not export
-- enough information to emulate it easily.

w = Window{320,100}

function aj_cb(self)
   -- self.target.label = self:format()
   self.target.label = format("%.4f", self.value)
   self.target:redraw()
end

b1 = Box{20,30,80,25; box=Boxtype.down, color=Color.white}

a1 = Adjuster{20+80,30,3*25,25; target=b1, callback=aj_cb}
a1:callback()

b2 = Box{20+80+4*25,30,80,25; box=Boxtype.down, color=Color.white}

a2 = Adjuster{b2.x+b2.w,10,25,3*25; target=b2, callback=aj_cb}
a2:callback()

w.resizable = w
w:end_layout()
w:show()
