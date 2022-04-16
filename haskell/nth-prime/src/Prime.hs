module Prime (nth) where

nth :: Int -> Maybe Integer
nth 0 = Nothing
nth n = Just $ take n listOfPrimes !! (n-1)

listOfPrimes :: [Integer]
listOfPrimes = 2 : [ x | x <- [3,5..], isPrime x]

isPrime :: Integer -> Bool
isPrime x = all (\n -> x `mod` n /= 0) [3,5.. (floor . sqrt . fromIntegral) x :: Integer]

