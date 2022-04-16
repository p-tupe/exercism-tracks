module Bob
  ( responseFor
  )
where

import           Data.Char                      ( isUpper
                                                , isAlpha
                                                , isSpace
                                                )

responseFor :: String -> String
responseFor x | isSilent        = "Fine. Be that way!"
              | isYell && isQue = "Calm down, I know what I'm doing!"
              | isYell          = "Whoa, chill out!"
              | isQue           = "Sure."
              | otherwise       = "Whatever."
 where
  xs       = filter (not . isSpace) x
  ys       = filter isAlpha xs
  isSilent = null xs
  isYell   = (not . null) ys && all isUpper ys
  isQue    = last xs == '?'
