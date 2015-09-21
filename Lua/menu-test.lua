w = Window{400,200, "Menu_Entry test"}
mb = Menu_Bar{0,0,400,24}

mb:add(Menu_Entry{"File/Open..."; inactive=1})

quit_entry = Menu_Entry{"File/Quit"}
function quit_entry:callback()
   exit(0)
end
mb:add(quit_entry)

i = mb:add(Menu_Entry{"Mode/Copying"; radio=1})
i = mb:add(Menu_Entry{"Mode/Editing"; radio=1})
i = mb:add(Menu_Entry{"Mode/Playing"; radio=1, value=1, divider=1})

i = mb:add(Menu_Entry{"Mode/Sleepy"; toggle=1, value=1})


i = mb:add(Menu_Entry{"Shortcuts/Shortcut-b..."; 
              shortcut=Modifier.meta + Modifier.ctrl + strbyte("b")})

w:show()
