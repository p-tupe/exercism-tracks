module Triangle (rows) where

rows :: Int -> [[Integer]]
rows 0 = []
rows n = rows (n - 1) ++ [row n]

row :: Int -> [Integer]
row n = map (toInteger . c m) [0..m]
  where m = n - 1

f :: Int -> Int -- factorial f n = n!
f 0 = 1
f n = n * f (n - 1)

c :: Int -> Int -> Int -- combination c n k = nCk = C (n,k)
c n k = f n `div` (f k * f (n - k))
