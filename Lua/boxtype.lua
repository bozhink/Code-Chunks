-- translation of boxtype.cxx, heavily Luaified

-- invoke as "flua square=1 boxtype.lua" for square boxes

W = 180
H = 50
ROWS = 8
N = 0

function next_coords()
   local x = mod(N, 4)
   local y = floor(N / 4)
   N = N + 1
   x = x * W + 10
   y = y * H + 10
   if square then
      return x,y,H-20,H-20
   else
      return x,y,W-20,H-20
   end
end

function base_box(name, boxtype)
   local x,y,w,h = next_coords()
   local b = Box{x,y,w,h; labelsize = 12}
   b.box = boxtype
   b.label = name
   if square then
      b.align = Align.right
   end
   return b
end

function box(name)
   local long_name = "Boxtype."..name
   return base_box(long_name, Boxtype[name])
end

function frame(name)
   local long_name = "Frametype."..name
   return base_box(long_name, Frametype[name])
end

w = Window{4*W, ROWS*H; box=Boxtype.flat, color=12} -- light blue

box'none'
box'flat'

N = N + 2

box'up'
box'down'
frame'up'
frame'down'

box'thin_up'
box'thin_down'
frame'thin_up'
frame'thin_down'

box'engraved'
box'embossed'
frame'engraved'
frame'embossed'

box'border'
box'shadow'
frame'border'
frame'shadow'

box'rounded'
box'rshadow'
frame'rounded'
box'rflat'

box'oval'
box'oshadow'
frame'oval'
box'oflat'

box'round_up'
box'round_down'
box'diamond_up'
box'diamond_down'

w.resizable = w
w:end_layout()

w:show()
