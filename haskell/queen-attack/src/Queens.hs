module Queens
  ( boardString
  , canAttack
  )
where


emptyBoard :: String
emptyBoard = unlines $ replicate 8 (unwords $ replicate 8 "_")


boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString Nothing         Nothing         = emptyBoard
boardString (Just (x1, y1)) Nothing         = addCell "W" (x1, y1) emptyBoard
boardString Nothing         (Just (x2, y2)) = addCell "B" (x2, y2) emptyBoard
boardString (Just (x1, y1)) (Just (x2, y2)) = addCell "W" (x1, y1) (addCell "B" (x2, y2) emptyBoard)


addCell :: String -> (Int, Int) -> String -> String
addCell piece (x, y) board = unlines . map unwords $ rankF ++ (newRank : tail rankS)
 where
  boardList      = (map words . lines) board
  (rankF, rankS) = splitAt x boardList
  (fileF, fileS) = splitAt y (head rankS)
  newRank        = fileF ++ (piece : tail fileS)


canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (x1, y1) (x2, y2) | x1 == x2                       = True -- Row
                            | y1 == y2                       = True -- Col
                            | abs (x1 - x2) == abs (y1 - y2) = True -- Diag
                            | otherwise                      = False
