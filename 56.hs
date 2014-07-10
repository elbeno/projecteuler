numToList n | n < 10 = [n]
            | otherwise = (n `mod` 10) : (numToList (n `div` 10))

digitSum n = sum $ numToList n

power x 0 = 1
power x y = x * power x (y-1)

anslist = [(a,b) | a <- [1..99], b <- [1..99]]

f (a,b) = power a b

anslist' = map (digitSum . f) anslist

answer = foldl maxop 0 anslist'
    where maxop x y = if x > y then x else y

