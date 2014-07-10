numToList n | n < 10 = [n]
            | otherwise = (n `mod` 10) : (numToList (n `div` 10))

power x 0 = 1
power x y = x * power x (y-1)

f x y = y == (length $ numToList $ power x y)

l = [(a,b) | a <- [1..99], b <- [1..99]]

f' (a,b) = f a b

l' = filter (==True) (map f' l)

answer = length l'
