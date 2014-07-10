numToList n | n < 10 = [n]
            | otherwise = (n `mod` 10) : (numToList (n `div` 10))

listToNum [] = 0
listToNum [n] = n
listToNum (n:ns) = n + (10*(listToNum ns))

primes = 2 : [x | x <- [3,5..], all (\p -> x `mod` p > 0) (factorsToTry x)]
    where factorsToTry x = takeWhile (\p -> p*p <= x) primes

isPrime 1 = False
isPrime n = foldl (\a b -> a && (n `mod` b) > 0) True (takeWhile (\x -> x*x <= n) primes)

considerPrimes = tail $ tail $ tail $ tail primes

isTruncPrimeL 0 = True
isTruncPrimeL n = let t = listToNum $ reverse $ tail $ reverse $ numToList n
                  in isPrime n && isTruncPrimeL t


isTruncPrimeR 0 = True
isTruncPrimeR n = let t = listToNum $  tail $ numToList n
                  in isPrime n && isTruncPrimeR t

isTruncPrime n = isTruncPrimeL n && isTruncPrimeR n


truncPrimeList pl = acc pl 0
    where acc _ 11 = []
          acc (p:ps) x = if isTruncPrime p
                         then p : acc ps (x+1)
                         else acc ps x

answer = sum $ truncPrimeList considerPrimes

