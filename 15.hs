nextRow r = (1 : (map (\(x,y) -> x + y) (zip r (tail r)))) ++ [1]

power :: (a -> a) -> Int -> a -> a
power f 0 = (\x -> x)
power f n = (\x -> f (power f (n-1) x))

pascalsTriangleRow 1 = [1]
pascalsTriangleRow n = power nextRow (n-1) [1]

ans n = sum $ map (^2) (pascalsTriangleRow n)

answer = ans 21
