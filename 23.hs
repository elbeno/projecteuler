import Data.List
import Data.IntSet (toList, fromList)

properDivisors n = 1 : acc n 2
    where acc n d | d*d > n = []
                  | d*d == n = [d]
                  | d*d < n = if n `mod` d == 0
                              then d : (n `div` d) : acc n (d+1)
                              else acc n (d+1)

sumProperDivisors n = sum $ properDivisors n

answer = sum [1..20161] - (sum $ nub' $ genSums abundants)
    where nub' = toList . fromList
          abundants = filter (\x -> x < sumProperDivisors x) [12..20149]
          genSums xs = [(x + y) | x <- xs, y <- xs, y >= x, (x + y) < 20162]






