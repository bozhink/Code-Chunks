-- Translation of browser.cxx

_ = [[
This is a test of how the browser draws lines.
This is a second line.
This is a third.

That was a blank line above this.

@r@_Right justify
@c@_Center justify
@_Left justify

@bBold text
@iItalic text
@b@iBold Italic
@fFixed width
@f@bBold Fixed
@f@iItalic Fixed
@f@i@bBold Italic Fixed
@lLarge
@l@bLarge bold
@sSmall
@s@bSmall bold
@s@iSmall italic
@s@i@bSmall italic bold
@uunderscore
@C1RED
@C2Green
@C4Blue

	You should try different browser types:
	Fl_Browser
	Fl_Select_Browser
	Fl_Hold_Browser
	Fl_Multi_Browser
]]

_ = nil

fname = "browser.lua"

if arg then
   if getn(arg) == 1 then
      fname = arg[1]
   end
   if getn(arg) > 1 then
      print("usage: browser.lua [filename]")
      exit(1)
   end
end

w = Window{400,400,fname; box=Boxtype.none}
browser = Select_Browser{0,0,400,400; type=Browsertype.multi}

function browser:callback()
   print("callback, selection", self.value, "event_clicks", Fl.event_clicks)
end

if not browser:load(fname) then
   print("can't load ", fname)
   exit(1)
end

browser.position = 0
w.resizable = browser
w:show()

