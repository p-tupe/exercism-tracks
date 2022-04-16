module Anagram (anagramsFor) where

import Data.Char (toLower)

anagramsFor :: String -> [String] -> [String]
anagramsFor [] _ = []
anagramsFor _ [] = []
anagramsFor x (y:ys)
  | isAnagram x y = y : anagramsFor x ys
  | otherwise = anagramsFor x ys

isAnagram :: String -> String -> Bool
isAnagram a b = length x == length y && x /= y && letterCheck x y
                  where
                    x = map toLower a
                    y = map toLower b

letterCheck :: String -> String -> Bool
letterCheck [] [] = True
letterCheck _ [] = False
letterCheck [] _ = False
letterCheck x (y:ys) = (length reducedX == length reducedY)
                       && letterCheck reducedX reducedY
                          where
                            reducedX = filter (/= y) x
                            reducedY = filter (/= y) ys
