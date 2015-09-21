-- Translation of ask.cxx

function get_string()
   local complete = {}
   w = Window{320,75}
   input = Input{60,10,250,25,"Input:"}
   cancel = Button{60,40,80,25,"cancel"}
   function cancel:callback()
      %complete.cancel = 1
   end

   ok = Return_Button{150,40,80,25,"OK"}
   function ok:callback()
      %complete.ok = 1
   end

   w:hotspot(cancel)
   End{}
   w:set_modal()
   w:show()

   while 1 do
      Fl:wait()
      if complete.ok then
         local string = input.value
         w:delete()
         return string
      elseif complete.cancel then
         w:delete()
         return nil
      end
   end
end



w = Window{200,55}

function w:callback()
   if fl_ask("Are you sure you want to quit?") then
      exit(0)
   else
      return
   end
end

b = Return_Button{20,10,160,35, "test text"}

function b:callback()
   local new_value = get_string()
   if new_value then
      self.label = new_value
      self:redraw()
   end
end

w.resizable = b
w:show()
