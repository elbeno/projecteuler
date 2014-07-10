tri n = n * (n+1) `div` 2

--let n have k digits when written in base p
--let d be the most significant digit
--f n = tri d * (tri p)^(k-1) + (d+1) * f (n `div` p)

g 0 = 0
g n | n < 8 = sum [1..n]
    | otherwise = sum [1..k-1]*28^m + k * g (n-(k-1)*7^m)
    where (f,r) = n `quotRem` 7
          m = floor ( log (fromInteger n) / log 7)
          k = ceiling ( fromInteger n / 7^m )   

nextRow r = (1 : (map (\(x,y) -> x + y) (zip r (tail r)))) ++ [1]

power :: (a -> a) -> Int -> a -> a
power f (-1) = (\x -> x)
power f n = (\x -> f (power f (n-1) x))

pascalsTriangleRow 0 = [1]
pascalsTriangleRow n = power nextRow (n-1) [1]

trunc10 n = n `div` 10

divisibleBy7 n | n == -7 || n == 0 || n == 7 || n == 28 || n == 49 = True
               | n < 0 = False
               | otherwise = let n' = trunc10 n
                                 n'' = n `mod` 10
                             in divisibleBy7 (n' - 2*n'')






