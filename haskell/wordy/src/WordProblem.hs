module WordProblem
  ( answer
  )
where

import           Data.Char                      ( isDigit
                                                , isAlpha
                                                )

answer :: String -> Maybe Integer
answer p = if isValidQue p && isValidExpr expr
  then solve (getNums expr) (getOps expr)
  else Nothing
  where expr = getExpr p

isValidQue s = "What is " == take 8 s && '?' == last s

isValidExpr :: [String] -> Bool
isValidExpr [x         ] = all (not . isAlpha) x
isValidExpr (x : y : xs) = isValidExpr [x] && all isAlpha y
isValidExpr _            = False

getExpr = words . init . drop 8

getNums :: [String] -> [Int]
getNums = map (\x -> read x :: Int) . filter (all (not . isAlpha))

getOps :: [String] -> [String]
getOps = filter (/= "by") . filter (all isAlpha)

solve :: [Int] -> [String] -> Maybe Integer
solve [x         ] []       = Just (fromIntegral x)
solve (x : y : xs) (o : os) = case o of
  "plus"       -> solve (x + y : xs) os
  "minus"      -> solve (x - y : xs) os
  "divided"    -> solve (x `div` y : xs) os
  "multiplied" -> solve (x * y : xs) os
  _            -> Nothing
solve _ _ = Nothing
