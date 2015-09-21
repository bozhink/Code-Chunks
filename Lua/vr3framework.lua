collectgarbage(300)


-- dofile'util.lua'
flua_require("util.lua")

if fl_gc_stats then
   collectgarbage()
   print("before vr3framework", gcinfo())
end

vr3_defaults = {
   toplevel_w = 160,
   toplevel_h = 220,
   base_font = Font.helvetica,
   base_fontsize = 10,
   base_height = 16,
   button_width = 32,
   input_width = 100,
   pagekey_width = 8
}
   
   
function establish_vr3_defaults()
   Fl_Widget.initializers = {labelsize =  vr3_defaults.base_fontsize}
   Fl_Menu_.initializers = {textsize = vr3_defaults.base_fontsize}

   Fl_Browser_.initializers = {textsize = vr3_defaults.base_fontsize, box = Boxtype.flat}
   Fl_Input_.initializers = {textsize =  vr3_defaults.base_fontsize}

   Fl_Check_Button.initializers = {down_box = Boxtype.thin_down, 
      color = Color.white, selection_color=Color.black}
   Fl_Check_Button.ignore_initializers = {box=1}

end

function build_main_window(label) 
   local s = {}
   local v3 = vr3_defaults
   s.window = Window{v3.toplevel_w, v3.toplevel_h; label=label}
   s.window.resizable = s.window -- in case we don't make it any farther

   s.toolbar = Pack{0, v3.toplevel_h-v3.base_height, 
      v3.toplevel_w, v3.base_height;
      type=Packtype.horizontal}
   
   Button{0,0,v3.button_width,v3.base_height;
      label="Done", 
      callback=function (self)
                  local done_cb = %s.done_cb
                  if done_cb then
                     call(done_cb, {%s})
                  end
               end}

   function s:done_cb() 
      self.window:hide() 
      self.window:delete()
   end

   if nil then
      local menu = Menu_Button{0,0,v3.button_width,v3.base_height;
	 label="Menu",
	 callback = function (self)
		       local menu_cb = %s.menu_cb
		       if menu_cb then
			  call(done_cb, {self})
		       end
		    end}
      
      s.menu = menu;
      menu.add("About")
      
      function s:menu_cb() 
	 fl_message("About...")
      end
   end

   s.toolbar:end_layout()

   if nil then
      -- Try making an up/down button?
      s.pagekey = Repeat_Button{160-vr3_defaults.pagekey_width,220-vr3_defaults.base_height, 
	 vr3_defaults.pagekey_width, vr3_defaults.base_height;
	 labeltype=Labeltype.symbol, label="@2<",
	 shortcut = FL_Page_Up}
   end


   s.content = Group{0,0,160, 220-vr3_defaults.base_height;
      box=Boxtype.flat}
   s.window.resizable = s.content
  return s
end   

function run_about_window(t)
   local appname = t.appname or "<appname here>"
   local s = build_main_window(appname)

   s.content:begin_layout()
   local scroll = Scroll{0,0,160,220-16; type=0}
   local p = Pack{0,0,160,220-16}
   s.content.resizable = scroll 
   
   local versionstring = appname
   if t.version then
      versionstring = versionstring .. " " .. t.version
   end
   local b
   -- should be using boxes, but Boxes are semi-broken
   b = Button{0,0,160,24;
      label=versionstring, box=Boxtype.flat, labelfont=Font.helvetica + Font.bold}
   b:set_output()

   if t.copyright then
      b = Button{0,0,160,12;
         label=t.copyright, box=Boxtype.flat}
      b:set_output()
   end

   if t.author then 
      b = Button{0,0,160,12;
         label=t.author, box=Boxtype.flat}
      b:set_output()
   end

   if t.license then
      b = Button{0,0,160,80;
         label=t.license, box=Boxtype.flat}
      b:set_output()
   end

   if t.note then
      b = Button{0,0,160,80;
         label=t.note, box=Boxtype.flat}
      b:set_output()
   end

   s.window:end_layout()
   s.window:set_modal()
   s.window:show()
end
   

if fl_gc_stats then
   collectgarbage()
   print("after vr3framework", gcinfo())
end
