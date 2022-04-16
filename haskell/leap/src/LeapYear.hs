module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear y = y `rem` 4 == 0 && (y `rem` 100 /= 0 || y `rem` 400 == 0)
