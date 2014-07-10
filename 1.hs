mult3or5 :: [Integer]
mult3or5 = [x | x <- [1..999], x `mod` 3 == 0 || x `mod` 5 == 0]

answer = sum mult3or5

tri :: Integer -> Integer
tri x = x * (x+1) `div` 2

sumOfMults n limit = let x = limit `div` n
                     in tri x * n

altAnswer = sumOfMults 3 999 + sumOfMults 5 999 - sumOfMults 15 999
