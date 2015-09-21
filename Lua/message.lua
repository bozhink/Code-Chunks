-- translation of message.cxx

-- This is a pretty silly sample for Lua because the C++ version is
-- designed to test the printf formatting, and we already know lua's
-- format() works just fine.

fl_message(format("Spelling check sucessfull, %d errors found with %g%% confidence",
                  1002, 100*(15/77.0)))

fl_alert(format("Quantum fluctuations in the space-time continuim detected, "..
                "you have %g seconds to comply.", 10.0))

print("fl_ask returned", 
      fl_ask(format("Do you really want to %s?", "continue")))

fl_alert("fl_choice not supported")


print("fl_input returned", 
      fl_input(format("Please enter a string for '%s':", "testing"), "this is the default value"))

print("fl_password returned", 
      fl_password(format("Enter %s's password:", "somebody"), nil))


