module SpaceAge
  ( Planet(..)
  , ageOn
  )
where

data Planet = Mercury | Venus | Earth | Mars | Jupiter | Saturn | Uranus | Neptune

type Seconds = Float
type Years = Float
type Scale = Float

earthYear :: Seconds
earthYear = 31557600.0

orbialPeriod :: Planet -> Scale -- wrt Earth Year
orbialPeriod Mercury = 0.2408467
orbialPeriod Venus   = 0.61519726
orbialPeriod Earth   = 1
orbialPeriod Mars    = 1.8808158
orbialPeriod Jupiter = 11.862615
orbialPeriod Saturn  = 29.447498
orbialPeriod Uranus  = 84.016846
orbialPeriod Neptune = 164.79132

ageOn :: Planet -> Seconds -> Years
ageOn p s = s / (earthYear * orbialPeriod p)
