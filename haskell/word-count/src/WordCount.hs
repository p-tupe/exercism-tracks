module WordCount
  ( wordCount
  )
where

import           Data.Char                      ( isAlphaNum
                                                , toLower
                                                )

wordCount :: String -> [(String, Int)]
wordCount = getCount . map sanitize . split

split :: String -> [String]
split = words . map (\x -> if isAlphaNum x || x == '\'' then x else ' ')

sanitize :: String -> String
sanitize w | not (isAlphaNum (head w)) = sanitize (tail w)
           | not (isAlphaNum (last w)) = sanitize (init w)
           | otherwise                 = map toLower w

getCount :: [String] -> [(String, Int)]
getCount s@(w : ws) = (w, length s - length rs) : getCount rs
  where rs = filter (/= w) ws
getCount _ = []
