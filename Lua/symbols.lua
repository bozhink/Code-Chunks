-- Translation of symbols.cxx

N = 0
W = 60
H = 60
ROWS = 5
COLS = 5

function bt(name)
   local x = mod(N, COLS)
   local y = floor(N/COLS)
   N = N + 1
   print(x,y)
   x = x*W+10
   y = y*H+10
   print(x,y)
   Box{x,y,W-20,H-20, name; box=Boxtype.none,
      align=Align.bottom, labelsize=11}
   Box{x,y,W-20,H-20,name; box=Boxtype.up,
      labeltype=Labeltype.symbol, labelcolor=Color.dark3}
end

w = Window{COLS*W,ROWS*H+20}

bt("@->")
bt("@>")
bt("@>>")
bt("@>|")
bt("@>[]")
bt("@|>")
bt("@<-")
bt("@<")
bt("@<<")
bt("@|<")
bt("@[]<")
bt("@<|")
bt("@<->")
bt("@-->")
bt("@+")
bt("@->|")
bt("@||")
bt("@arrow")
bt("@returnarrow")
bt("@square")
bt("@circle")
bt("@line")
bt("@menu")
bt("@UpArrow")
bt("@DnArrow")

w:end_layout()

w.resizable = w
w:show()
