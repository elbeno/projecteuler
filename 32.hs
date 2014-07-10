numToList n | n < 10 = [n]
            | otherwise = n `mod` 10 : (numToList (n `div` 10))

isPandigitalList x = x == [1..9]

sort [] = []
sort (x:xs) = (sort $ filter (<x) xs) ++ [x] ++ (sort $ filter (>x) xs)

isPandigital x y p = let l = (numToList x) ++ (numToList y) ++ (numToList p)
                     in isPandigitalList $ sort l

properDivisorsBut1 n = acc n 2
    where acc n d = if d*d > n
                    then []
                    else if n `mod` d == 0
                         then d : (n `div` d) : acc n (d+1)
                         else acc n (d+1)

consider = [1000..9999]

answer = sum $ filter hasPandigitalProduct consider

hasPandigitalProduct p = acc p (properDivisorsBut1 p)
    where acc prod [] = False
          acc prod (x:y:xs) = (isPandigital x y prod) || acc prod xs
