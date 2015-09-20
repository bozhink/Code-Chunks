module Main where

hello = putStrLn "Hello"

zeta n = if n < 0.001 then 0 else zeta n/2.0