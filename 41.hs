primes = 2 : [x | x <- [3,5..], all (\p -> x `mod` p > 0) (factorsToTry x)]
    where factorsToTry x = takeWhile (\p -> p*p <= x) primes

isPrime n = foldl (\a b -> a && (n `mod` b) > 0) True (takeWhile (\x -> x*x <= n) primes)

numToList n | n < 10 = [n]
            | otherwise = (n `mod` 10) : (numToList (n `div` 10))

sort [] = []
sort [n] = [n]
sort (n:ns) = (sort $ filter (<n) ns) ++ [n] ++ (sort $ filter (>=n) ns)

tests = [[1]
         ,[1,2]
         ,[1,2,3]
         ,[1,2,3,4]
         ,[1,2,3,4,5]
         ,[1,2,3,4,5,6]
         ,[1,2,3,4,5,6,7]
         ,[1,2,3,4,5,6,7,8]
         ,[1,2,3,4,5,6,7,8,9]]

isPandigital n = let l = numToList n
                     len = (length l) - 1
                 in (sort l) == (tests !! len)


answer = filter isPandigital (takeWhile (<=987654321) primes)
