tri n = n * (n + 1) `div` 2

cands = [(x, y, (x * y)) | x <- takeWhile (<5000) $ map tri [1..], 
         y <- takeWhile (<5000) $ map tri [1..]]

f (i, j, p1) (x, y, p2) = let a = abs (2000000 - p1)
                              b = abs (2000000 - p2)
                          in if a < b
                             then (i, j, p1)
                             else (x, y, p2)

