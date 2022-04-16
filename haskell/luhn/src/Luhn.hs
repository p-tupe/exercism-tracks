module Luhn (isValid) where

import Data.Char (digitToInt)

isValid :: String -> Bool
isValid n
  | length str <= 1 = False
  | otherwise = s str `mod` 10 == 0              
  where 
    str = (reverse . concat . words) n

s :: String -> Int
s (x:y:xs) = digitToInt x + f (digitToInt y) + s xs
s [x] = digitToInt x
s _ = 0

f :: Int -> Int
f n 
  | n * 2 > 9 = n * 2 - 9
  | otherwise = n * 2
