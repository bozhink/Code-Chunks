flua_require("vr3framework.lua")

establish_vr3_defaults()

sample_shop_item = {
   name="soda",
   complete=1,
   once=1,
   description="Diet Mountain Dew, of course"
}

-- backstop, in case there's an empty file
need_list = {}
got_list = {}

current_filename = "default"

function replace_list_contents(list, new)
   for i,v in list do
      list[i] = nil
   end
   for i = 1, getn(new) do
      list[i] = new[i]
   end
end

-- These two are called in data files.
function shopping_list_got(l)
   replace_list_contents(got_list, l)
end

function shopping_list_need(l)
   replace_list_contents(need_list, l)
end

-- load the items
dofile(current_filename .. ".slist")

current_list = need_list


function dump_current()
   writeto(current_filename .. ".slist")
   flush()
   write("shopping_list_need{\n")
   dump_body(need_list)
   write("}\n")
   write("shopping_list_got{\n")
   dump_body(got_list)
   write("}\n")
   flush()
   writeto()
end

function dump_body(l)
   for i = 1,getn(l) do
      dump_item(l[i])
      write(",\n")
   end
end

function dump_item(item)
   write("{")
   for i,v in item do
      write(i) write("=") 
      if type(v) == "string" then
         write(format("%q", v))
      else
         write(tostring(v))
      end
      write(", ")
   end
   write("}")
end

-- Render an item suitable for display in a browser
function browser_line_for_item(item)
   if item.complete then
      return "@-@." .. item.name
   else
      return "@." .. item.name
   end
end

-- Refresh the whole browser
function refresh_all()
   br:clear()
   for i = 1,getn(current_list) do
      br:add(browser_line_for_item(current_list[i]))
   end
end

-- Update the rendering of a single item by index
function refresh_item(i)
   br:set_text(i, browser_line_for_item(current_list[i]))
end

set = build_main_window("Shopping list")

-- On "done", checkpoint our state and bail
function set:done_cb()
   dump_current()
   exit(0)
end

---------- toolbar buttons
set.toolbar:begin_layout()
new_button = Button{0,0,vr3_defaults.button_width,0;
   label="New"}

function new_button:callback()
   item = {name="New item"}
   tinsert(current_list, item)
   run_window_on_item(current_list.n)
   refresh_all()
   br:bottomline(br.size)
end

menu = Menu_Button{0,0,vr3_defaults.button_width,0;
   label="Menu"}

process_entry = Menu_Entry{"Process"}

function process_entry:callback()
   -- What the heck, shallow copy both of 'em
   local new_need = {}
   local new_got = {}
   for i = 1, getn(need_list) do
      local item = need_list[i]
      if item.complete then
         item.complete = nil
         -- copy to got only if not temp
         if not item.once then
            tinsert(new_got, item)
         end
      else
         tinsert(new_need, item)
      end
   end

   for i = 1, getn(got_list) do
      local item = got_list[i]
      if item.complete then
         item.complete = nil
         tinsert(new_need, item)
      else
         tinsert(new_got, item)
      end
   end

   got_list = new_got
   need_list = new_need
   -- I suppose this should return to the last view, huh.
   switch_to_need()
   refresh_all()
end



purge_entry = Menu_Entry{"Purge"}
function purge_entry:callback()
   if fl_ask("Delete all completed items?") then
      for i = getn(current_list),1,-1 do
         if current_list[i].complete then
            tremove(current_list,i)
         end
      end
      refresh_all()
   end
end


about_entry = Menu_Entry{"About"}
function about_entry:callback()
   run_about_window{appname="Shopping List", 
      version="0.1", copyright="Copyright (C) 2001",
      author="Jay Carlson <nop@nop.com>",
      note=
[[Dedicated to www.bassdrive.com

Mike Zamansky:
Sorry for borrowing your
app design...]]}
end


menu:add(process_entry)
menu:add(purge_entry)
menu:add(about_entry)


choice = Choice{0,0,vr3_defaults.button_width*1.5,0}


function switch_to_need(self)
   current_list = need_list
   choice.value=0
   refresh_all()
end
function switch_to_got(self)
   current_list = got_list
   choice.value=1
   refresh_all()
end

choice:add(Menu_Entry{"Need"; callback=switch_to_need})
choice:add(Menu_Entry{"Got"; callback=switch_to_got})
choice.value = 0

set.toolbar:end_layout()

set.content:begin_layout()

br = Hold_Browser{0,0,set.content.w,set.content.h}
br.selection_color = br.color
set.content.resizable = br

refresh_all()

function br:callback() 
   local index = self.value
   if index ~= 0 then
      local old_topline = self.topline
      current_list[index].complete = not current_list[index].complete
      refresh_item(index)
      if Fl.event_clicks == 1 then
         -- fl_ask("testing")
         run_window_on_item(index)
      end
      -- self:deselect()
      self.topline = old_topline
   end
end


function run_window_on_item(index)
   local list = current_list
   local item = list[index]
   local gi = build_main_window("List item " .. item.name)
   gi.toolbar:begin_layout()
   Button{0,0,vr3_defaults.button_width,0; label="Delete", 
      callback=function (self) 
                  tremove(current_list , %index)
                  refresh_all()
                  %gi.window:hide() 
                  %gi.window:delete() 
               end }

   Button{0,0,vr3_defaults.button_width,0; label="Cancel", 
      callback=function (self) %gi.window:hide() %gi.window:delete() end }
   gi.menu = Menu_Button{0,0,vr3_defaults.button_width,0;
      label="Menu"}
   gi.menu = menu:add("About")
   function gi:done_cb()
      %item.name = self.input.value
      %item.complete = self.complete.value
      %item.once = self.once.value
      if self.desc.value == "" then 
         %item.description = nil
      else
         %item.description = self.desc.value
      end
      self.window:hide()
      self.window:delete()
      refresh_item(%index)
   end
   gi.toolbar:end_layout()

   gi.content:begin_layout()
   gi.input = Input{60,0,100,16; label="Name:", value=item.name}
   gi.complete = Check_Button{60,16,100,16; 
      label="Completed:", value=item.complete,
      align=Align.left}
   gi.once = Check_Button{60,32,100,16; 
      label="Once only:", value=item.once,
      align=Align.left}
   gi.desc = Multiline_Input{0,64,160,gi.content.h-64;
      label="Description:", value=item.description, align=Align.top_left}
   gi.content:end_layout()
   gi.content.resizable = gi.desc
   gi.window:set_modal()
   gi.window:show()
end

set.content:end_layout()
set.window:show()

print("after shopping, before gc", gcinfo())
collectgarbage(300)
print("after shopping", gcinfo())
