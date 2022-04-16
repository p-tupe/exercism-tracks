module Clock (addDelta, fromHourMin, toString) where

type Hour = Int
type Min = Int

data Clock = Clock Hour Min deriving Eq

fromHourMin :: Hour -> Min -> Clock
fromHourMin h m = addDelta h m (Clock 0 0)

toString :: Clock -> String
toString (Clock h m) = getStr h ++ ":" ++ getStr m
  where
    getStr x = (if x < 10 then "0" else "") ++ show x

addDelta :: Hour -> Min -> Clock -> Clock
addDelta h m (Clock h' m') = Clock x y
  where
    -- Convert all hours to minutes
    hx | h < 0 = (24 + h) * 60 | otherwise = h * 60
    hx' = h' * 60
    -- Sum all minutes and normalize into 24 hour scale
    mx' = (m' + m + hx + hx') `mod` (24 * 60)
    mx | mx' < 0 = (24 * 60) - mx' | otherwise = mx'
    -- Mod 24 gives hours, Mod 60 gives residue minutes
    x = getDecimal (fromIntegral mx / 60) `mod` 24
    y = mx `mod` 60

getDecimal :: Double -> Int
getDecimal = fst . properFraction
