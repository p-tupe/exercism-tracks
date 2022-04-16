module Acronym (abbreviate) where

import qualified Data.Char as C

abbreviate :: String -> String
abbreviate = concatMap getInitials . words

getInitials :: String -> String
getInitials "" = ""
getInitials w
  | hyphenated = getInitials (takeWhile (/= '-') w) ++ getInitials (tail (dropWhile (/= '-') w))
  | multiCaps = filter C.isUpper w 
  | otherwise = [initial]
  where
    hyphenated = '-' `elem` w -- eg metal-oxide
    multiCaps = any C.isUpper w && not (all C.isUpper w)  -- eg HyperText
    initial = C.toUpper (head (dropWhile (not . C.isAlpha) w))
