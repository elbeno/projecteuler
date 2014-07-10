cands = [(x,y) | x <- [1..428571], 
         y <- [(x * 1000000000000000000) `div` 428571428571428572
               .. (x * 1000000000000000000) `div` 428571428571428570]]


frac (x,y) = fromInteger x / fromInteger y

ans = foldl minop (1,1) (take 100 cands)
      where minop (a,b) (x,y) = if frac (a,b) < frac (x,y)
                                then (a,b)
                                else (x,y)



