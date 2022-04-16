module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance x y = Just $ sum [1 | (a, b) <- zip x y, a /= b, length x == length y]
