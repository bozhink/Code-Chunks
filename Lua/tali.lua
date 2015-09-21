randomseed(tonumber(date("%m%d%H%M%S")))

if my_gc_stats then
   collectgarbage()
   print("initial", gcinfo())
end

-- First, a bunch of generic dice stuff.

-- On a garbage hunt right now; let's make these globals.
current_roll = {1,1,1,1,1}
current_histogram = {0,0,0,0,0,0}


-- Roll a set of five dice
function random_dice()
   r = {}
   for i = 1,5 do
      r[i] = random(1,6)
   end
   return r
end

function do_random_dice()
   for i = 1,5 do
      current_roll[i] = random(1,6)
   end
end

function print_roll(r)
   for i=1,getn(r) do
      write(r[i]) write(" ")
   end
   write("\n") flush()
end

function make_histogram()
   local h = current_histogram
   for i = 1,getn(h) do
      h[i]=0
   end
   local r = current_roll
   for i = 1,getn(r) do
      h[r[i]] = h[r[i]] + 1
   end
end

function sum_dice(roll)
   local sum = 0
   for i =1,getn(roll) do
      sum = sum + roll[i]
   end
   return sum
end

function contains_straight(roll, histogram, atleast)
   for start = 1,7-atleast do
      local missed
      for trial = 0,atleast-1 do
         if histogram[trial+start] == 0 then
            missed = 1
         end
      end
      if not missed then return 1 end
   end
   return nil
end


-- score_function is a table mapping rule names to functions that
-- evaluate the score against a particular scoring rule.

score_function = {}

function make_upper_score_function(die)
   return function (roll, histogram)
             return histogram[%die]*%die
          end
end

score_function.u1 = make_upper_score_function(1)
score_function.u2 = make_upper_score_function(2)
score_function.u3 = make_upper_score_function(3)
score_function.u4 = make_upper_score_function(4)
score_function.u5 = make_upper_score_function(5)
score_function.u6 = make_upper_score_function(6)

function score_function.l3kind(roll, histogram)
   for i = 1,6 do
      if histogram[i] >= 3 then
         return sum_dice(roll)
      end
   end
   return 0
end

function score_function.l4kind(roll, histogram)
   for i = 1,6 do
      if histogram[i] >= 4 then
         return sum_dice(roll)
      end
   end
   return 0
end

function score_function.full_house(roll, histogram)
   local found_2, found_3
   for i = 1,6 do
      if histogram[i] == 3 then
         found_3 = 1
      end
      if histogram[i] == 2 then
         found_2 = 1
      end
   end
   if found_3 and found_2 then
      return 25
   else
      return 0
   end
end

function score_function.small_straight(roll, histogram)
   if contains_straight(roll, histogram, 4) then
      return 30
   else
      return 0
   end
end

function score_function.large_straight(roll, histogram)
   if contains_straight(roll, histogram, 5) then
      return 40
   else
      return 0
   end
end

function score_function.tali(roll, histogram)
   for i = 1,6 do
      if histogram[i] == 5 then
         return 50
      end
   end
   return 0
end

function score_function.chance(roll, histogram)
   return sum_dice(roll)
end


function dump_score_roll(r)
   local histogram = current_histogram
   make_histogram()
   for i,v in score_function do
      local score = v(r, histogram)
      if score > 0 then
         print(i, score)
      end
   end
end

function test_tali()
   local r = roll_dice()
   print_roll(r)
   dump_score_roll(r)
end

--------------------

-- OK, on to the UI.

if my_gc_stats then
   collectgarbage()
   print("before framework", gcinfo())
end

flua_require("vr3framework.lua")

if my_gc_stats then
   collectgarbage()
   print("after framework", gcinfo())
end

establish_vr3_defaults()

set = build_main_window("Tali")

set.toolbar:begin_layout()

Button{0,0,32,16; label="New", callback=function (self) do_newgame() end}

set.menu_button = Menu_Button{0,0,32,16; label="Menu"}
set.menu_button:add("About")

-- After we get more than one entry in the menu, we'll need to
-- distinguish between items.  For now, we know it's the About box.

set.menu_button.callback = function (self)
                              run_about_window{appname="Lua Tali", version="1.0",
                                 -- copyright="Copyright (C) 2001", 
                                 author="Jay Carlson <nop@nop.com>",
                                 note="Still dedicated to\nwww.bassdrive.com"}
                           end


set.content:begin_layout()

-- A list of die buttons
dice_b = {}
for i = 1,5 do
   dice_b[i] = Button{2 + 32*(i-1), 152, 28, 28; labelsize=18, 
      type=Buttontype.toggle}
end

function refresh_roll()
   for i=1,5 do
      dice_b[i].label = tostring(current_roll[i])
      dice_b[i]:redraw()
   end
end


function do_roll()
   rolls_left = rolls_left - 1
   for i = 1,5 do
      if not dice_b[i].value then
         current_roll[i] = random(1,6)
      end
   end
   make_histogram()
   refresh_roll()
   display_scores()
   if my_gc_stats then
      print(gcinfo())
   end
   -- hack: keep on pushing down the gc threshold.
   collectgarbage(310)
end   

roll_b = Button{0,220-16-16-4-2, 160, 20; label="Roll"}

function roll_b:callback()
   do_roll()
   if rolls_left == 0 then
      self:deactivate()
   end
end


function generic_score_callback(self)
   local score = self.score_f(current_roll, current_histogram)
   self.scored = score
   self.box = Boxtype.flat
   self:set_output()
   self.color = Color.gray
   self.old_score = nil
   do_newturn()
end

-- Here's a table of all the score buttons.

-- Right now we're pretty sloppy and store lots of game state
-- information attached to the buttons themselves.  

score_button = {}

upper_count = 0
function next_upper_button()
   local b = Button{2, 2+upper_count*18, 50, 16;
      align=Align.left + Align.inside}
   upper_count = upper_count + 1
   return b
end

function make_upper_button(name, label, score_f)
   score_button[name] = next_upper_button()
   score_button[name].base_label = label
   score_button[name].score_f = score_f
   score_button[name].label = label .. ": 0"
   score_button[name].callback = generic_score_callback
end

make_upper_button("u1", "1s", score_function.u1)
make_upper_button("u2", "2s", score_function.u2)
make_upper_button("u3", "3s", score_function.u3)
make_upper_button("u4", "4s", score_function.u4)
make_upper_button("u5", "5s", score_function.u5)
make_upper_button("u6", "6s", score_function.u6)

upper_button_names = {"u1", "u2", "u3", "u4", "u5", "u6"}

upper_total_b = Button{2, 2+6*18, 50, 16;
   label="Upper: 63", box=Boxtype.flat, align=Align.left+Align.inside, labelfont=Font.bold}
upper_total_b:set_output()

bonus_b = Button{2, 2+7*18, 55, 16;
   label="Bonus: 40", box=Boxtype.flat, align=Align.left+Align.inside, labelfont=Font.bold}
bonus_b:set_output()

lower_count = 0
function next_lower_button()
   local b = Button{64, 2+lower_count*18, 92, 16; 
      align = Align.right + Align.inside}
   lower_count = lower_count + 1;
   return b
end

function make_lower_button(name, label, score_f)
   score_button[name] = next_lower_button()
   score_button[name].base_label = label
   score_button[name].score_f = score_f
   score_button[name].label = label .. ": 0"
   score_button[name].callback = generic_score_callback
end

make_lower_button("l3kind", "3 of a kind", score_function.l3kind)
make_lower_button("l4kind", "4 of a kind", score_function.l4kind)
make_lower_button("full_house", "Full house", score_function.full_house)
make_lower_button("small_straight", "Small straight", score_function.small_straight)
make_lower_button("large_straight", "Large straight", score_function.large_straight)
make_lower_button("tali", "Tali", score_function.tali)
-- score_function.tali is not quite right.  

score_button.tali.score_f = function(roll, histogram)
                               local self = score_button.tali
                               local local_score = score_function.tali(roll, histogram)
                               if self.scored then
                                  return self.scored + local_score
                               else
                                  return local_score
                               end
                            end

score_button.tali.callback = function (self)
                                local score = score_function.tali(current_roll, current_histogram)
                                self.old_score = nil
                                if score == 0 then
                                   self.box = Boxtype.flat
                                   self:set_output()
                                   self.color = Color.gray
                                   if not self.scored then
                                      self.scored = score
                                   end
                                else
                                   turns_remaining = turns_remaining + 1
                                   self.scored = score + (self.scored or 0)
                                end
                                do_newturn()
                             end


make_lower_button("chance", "Chance", score_function.chance)

total_b = next_lower_button()
total_b.label = "Total: 000"
total_b.box = Boxtype.flat
total_b:set_output()
total_b.labelfont = Font.bold

function reset_buttons()
   for i,w in score_button do
      w.scored = nil
      w:clear_output()
      w.box = Boxtype.up
   end
end

reset_buttons()

function display_scores()
   for i,w in score_button do
      if not w.output then
         local score = w.score_f(current_roll, current_histogram)
         if  score ~= w.old_score then
            w.label = w.base_label .. ": " .. tostring(score)
            if score > 0 then
               -- w.box = Boxtype.up
               w.color = Color.dark1
            else
               -- w.box = Boxtype.thin_up
               w.color = Color.gray
            end
            w:redraw()
         end
      end
   end
end

function do_newturn()
   turns_remaining = turns_remaining - 1
   update_totals()
   if turns_remaining == 0 then
      -- game over
      set.content:set_output()
      roll_b:deactivate()
      for i = 1,5 do
         dice_b[i]:deactivate()
      end
      return
   end
   rolls_left = 3
   roll_b:activate()
   for i = 1,5 do
      -- unselect all the dice
      dice_b[i].value = nil
   end
   do_roll()
end

function update_totals()
   local upper_total = 0
   local bonus = 0
   local total = 0
   for i = 1, getn(upper_button_names) do
      local name = upper_button_names[i]
      local scored = score_button[name].scored
      if scored then
         upper_total = upper_total + scored
      end
   end
   if upper_total_b.old_score ~= upper_total then
      upper_total_b.old_score = upper_total
      upper_total_b.label = "Upper: " .. upper_total
      upper_total_b:redraw()
   end
   if upper_total >= 63 then
      bonus = 35
   end
   if bonus_b.old_score ~= bonus then
      bonus_b.old_score = bonus
      bonus_b.label = "Bonus: " .. bonus
      bonus_b:redraw()
   end
   for i,v in score_button do
      if v.scored then
         total = total + v.scored
      end
   end
   total = total + bonus
   if total_b.old_score ~= total then
      total_b.old_score = total
      total_b.label = "Total: " .. total
      total_b:redraw()
   end
end

function do_newgame()
   -- Wake up the scores from a previous game
   set.content:clear_output()
   roll_b:activate()
   for i = 1,5 do
      dice_b[i]:activate()
   end
   reset_buttons()
   turns_remaining = 13 + 1
   do_newturn()
end

do_newgame()

if my_gc_stats then
   collectgarbage()
   print("final", gcinfo())
end


set.window:show()
