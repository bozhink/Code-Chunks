help = putStrLn "Reverse Polish Notation"

calc :: String -> [Float]
calc = foldl f [] . words
  where
    f (x:y:zs) "+" = (y+x):zs
    f (x:y:zs) "-" = (y-x):zs
    f (x:y:zs) "*" = (y*x):zs
    f (x:y:zs) "/" = (y/x):zs
    f xs y = read y:xs