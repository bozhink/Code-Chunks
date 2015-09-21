-- translation of output.cxx

w = Window{400,400}

input = Input{50,0,350,25; 
   when=When.changed, 
   value="The quick brown fox\njumped over\nthe lazy dog."}

function input:callback()
   text.value = self.value
   text2.value = self.value
end

sizes = Value_Slider{50,25,350,25,"Size";
   type=Slidertype.horizontal, align=Align.left,
   minimum=1, maximum=64, step=1, value=14}

function sizes:callback()
   text.textsize = self.value
   text:redraw()
   text2.textsize = self.value
   text2:redraw()
end

fonts = Value_Slider{50,50,350,25,"Font";
   type=Slidertype.horizontal, align=Align.left,
   minimum=0, maximum=15, step=1, value=0}

function fonts:callback()
   text.textfont = self.value
   text:redraw()
   text2.textfont = self.value
   text2:redraw()
end

text2 = Multiline_Output{100,150,200,100,"Multiline_Output";
   value=input.value, align=Align.bottom}

text = Output{100,280,200,30,"Output";
   value=input.value, align=Align.bottom}

w.resizable = text2
w:show()
