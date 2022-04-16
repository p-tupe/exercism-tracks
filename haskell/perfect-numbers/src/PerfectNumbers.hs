module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify n
  | n <= 0 = Nothing
  | p n > n = Just Abundant
  | p n < n = Just Deficient
  | otherwise = Just Perfect
  where 
    p m = sum [ x | x <- [1..m-1], m `rem` x == 0]
