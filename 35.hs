numToList n | n < 10 = [n]
            | otherwise = (n `mod` 10) : (numToList (n `div` 10))

listToNum [] = 0
listToNum (n:ns) = n + (10*(listToNum ns))

rotateList [] = []
rotateList (n:ns) = ns ++ [n]

rotatedNums n = r n
    where r x = let x' = listToNum $ rotateList $ numToList x
                in x : (if x' == n
                        then []
                        else r x')

primes = 2 : [x | x <- [3,5..], all (\p -> x `mod` p > 0) (factorsToTry x)]
    where factorsToTry x = takeWhile (\p -> p*p <= x) primes

isPrime n = foldl (\a b -> a && (n `mod` b) > 0) True (takeWhile (\x -> x*x <= n) primes)

primesBelow1M = takeWhile (<1000000) primes

rotatedPrimes = map rotatedNums primesBelow1M

f [] = True
f (x:xs) = (isPrime x) && (f xs)

answer = length $ filter f rotatedPrimes
