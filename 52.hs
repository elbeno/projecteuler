numToList n | n < 10 = [n]
            | otherwise = (n `mod` 10) : (numToList (n `div` 10))

sort [] = []
sort [x] = [x]
sort (x:xs) = (sort $ filter (<x) xs)
              ++ [x] 
              ++ (sort $ filter (>x) xs)

find n = let n1 = sort $ numToList n
             n2 = sort $ numToList (2*n)
             n3 = sort $ numToList (3*n)
             n4 = sort $ numToList (4*n)
             n5 = sort $ numToList (5*n)
             n6 = sort $ numToList (6*n)
         in if n1 == n2 && n1 == n3 && n1 == n4 && n1 == n5 && n1 == n6
            then n
            else find (n+1)
