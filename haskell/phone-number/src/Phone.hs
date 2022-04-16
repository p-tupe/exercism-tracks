module Phone
  ( number
  )
where

import           Data.Char                      ( isDigit
                                                , digitToInt
                                                )

number :: String -> Maybe String
number n | isValid sanitized = Just sanitized
         | otherwise         = Nothing
  where sanitized = sanitize n

-- removes international code and punctuations
sanitize :: String -> String
sanitize "" = ""
sanitize n@(x : xs) | x == '+'  = sanitize xs
                    | x == '1'  = sanitize xs
                    | otherwise = filter isDigit n

-- validates number by checking length, area code and exchange code
isValid :: String -> Bool
isValid n | length n /= 10          = False
          | digitToInt (head n) < 2 = False
          | digitToInt (n !! 3) < 2 = False
          | otherwise               = True


