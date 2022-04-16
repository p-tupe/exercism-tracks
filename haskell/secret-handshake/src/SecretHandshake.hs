module SecretHandshake
  ( handshake
  )
where

handshake :: Int -> [String]
handshake = reverse . getSecret
 where
  getSecret n | n >= 16   = reverse $ getSecret (n `rem` 16)
              | n >= 8    = "jump" : getSecret (n `rem` 8)
              | n >= 4    = "close your eyes" : getSecret (n `rem` 4)
              | n >= 2    = "double blink" : getSecret (n `rem` 2)
              | n >= 1    = ["wink"]
              | otherwise = []
