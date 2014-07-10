power x 0 = 1
power x y = x * power x (y-1)

answer = sum $ map (\x -> power x x) [1..1000]
