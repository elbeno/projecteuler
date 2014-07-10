numToList n
    | n < 10 = [n]
    | n >= 10 = (n `mod` 10) : numToList (n `div` 10)

power x 0 = 1
power x y = x * power x (y-1)

answer = sum $ numToList $ power 2 1000






