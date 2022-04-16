module Minesweeper
  ( annotate
  )
where

import           Data.Char                      ( intToDigit )

type Position = (Int, Int)
type Board = [String]

annotate :: Board -> Board
annotate []   = []
annotate [""] = [""]
annotate b    = makeCell (0, 0) "" b

makeCell :: Position -> String -> Board -> Board
makeCell (x, y) new old
  | x == rows && y == cols = (lines . reverse) new
  | y == cols              = makeCell (x + 1, 0) ('\n' : new) old
  | x == rows              = makeCell (x, y + 1) new old
  | otherwise              = makeCell (x, y + 1) (cellVal (x, y) old : new) old
 where
  rows = length old
  cols = length (head old)

cellVal :: Position -> Board -> Char
cellVal (x, y) o | isMine $ o !! x !! y = '*'
                 | otherwise = if val == 0 then ' ' else intToDigit val
  where val = addNum (x, y) o

addNum :: Position -> Board -> Int
addNum (x, y) o =
  m (x - 1, y - 1)
    + m (x - 1, y)
    + m (x - 1, y + 1)
    + m (x, y - 1)
    + m (x, y + 1)
    + m (x + 1, y - 1)
    + m (x + 1, y)
    + m (x + 1, y + 1)
 where
  m (a, b) | a < 0                = 0
           | b < 0                = 0
           | a >= length o        = 0
           | b >= length (head o) = 0
           | otherwise            = if isMine (o !! a !! b) then 1 else 0

isMine :: Char -> Bool
isMine = (== '*')
