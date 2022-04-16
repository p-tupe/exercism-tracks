module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

type Coordinates = (Int, Int)

data Bearing = North | East | South | West deriving (Enum, Eq, Show)

data Robot = Robot { bearing :: Bearing, coordinates :: Coordinates } deriving (Show)

mkRobot :: Bearing -> Coordinates -> Robot
mkRobot = Robot

move :: Robot -> String -> Robot
move = foldl mkRobotMove

mkRobotMove :: Robot -> Char -> Robot
mkRobotMove (Robot North (x, y)) 'A' = Robot North (x, y + 1)
mkRobotMove (Robot East (x, y)) 'A' = Robot East (x + 1, y)
mkRobotMove (Robot South (x, y)) 'A' = Robot South (x, y - 1)
mkRobotMove (Robot West (x, y)) 'A' = Robot West (x - 1, y)
mkRobotMove (Robot West (x, y)) 'R' = Robot North (x, y)
mkRobotMove (Robot b (x, y)) 'R' = Robot (succ b) (x, y)
mkRobotMove (Robot North (x, y)) 'L' = Robot West (x, y)
mkRobotMove (Robot b (x, y)) 'L' = Robot (pred b) (x, y)
mkRobotMove r _ = r
