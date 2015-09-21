-- translation of tile.cxx

flua_require("shorthand.lua")

w = Window{300,300; box=Boxtype.none}
w.resizable = w

tile = Tile{0,0,300,300}

Box{0,0,150,150,"0"; box=Boxtype.down, 
   color=9, labelsize=36, align=Align.clip}

w1 = Window{150,0,150,150,"1"; box=Boxtype.none}
box1 = Box{0,0,150,150; box=Boxtype.down,
   color=19, labelsize=18, align=Align.clip, 
   label=
[[1
This is a
child
X window]]
}

w1.resizable = box1
w1:end_layout()

MBox = make_shorthand(Box, {box=Boxtype.down, labelsize=36, align=Align.clip})

MBox{0,150,70,150,"2a"; color=12}
MBox{70,150,80,150,"2b"; color=13}
MBox{150,150,150,70,"3a"; color = 12}
MBox{150,150+70,150,80,"3b"; color=13}

-- Hidden box to control resize behavior
r = Box{10,0,300-10,300-10; box=Frametype.none}
tile.resizable = r

tile:end_layout()
w:end_layout()

w:show()
w1:show()
