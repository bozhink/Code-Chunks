-- Utility functions       
function pp(value)
   if type(value) == "table" then
      write("{")
      for i,v in value do
         pp(i) write("=") pp(v) write("\n")
      end
      write("}")
   else
      write(tostring(value))
   end
   flush()
end

function ps(value) 
   if type(value) == "table" then
      write("{")
      for i,v in value do
         write(tostring(i)) write("=") write(tostring(v)) write("\n")
      end
      write("}")
   else
      write(tostring(value))
   end
   flush()
end
