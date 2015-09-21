
function make_shorthand(class, default)
   return function (t)
             local constructor_args = {}
             for i,v in %default do
                constructor_args[i] = v
             end
             for i,v in t do
                constructor_args[i] = v
             end
             return %class(constructor_args)
          end
end
