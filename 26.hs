-- compute a / b by long division

find (x,y,_) ((a,b,_):ls) = if x == a && y == b
                then True
                else find (x,y,0) ls
find _ [] = False

longDiv a b = acc a b 0
    where acc x y t = if x == 0 
                      then [(x,y,0)]
                      else if find (x,y,0) (longDiv a b)
                           then []
                           else if (x < y)
                                then (x,y,0) : acc (x*10) y (t+1)
                                else let result = x `div` y
                                         rem = x `mod` y
                                     in (x,y,result) : acc (rem*10) y (t+1)

fracs = zip [1..999] (map (length . (longDiv 1)) [1..999])




                                     
