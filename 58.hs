primes = 2 : [x | x <- [3,5..], all (\p -> x `mod` p > 0) (factorsToTry x)]
    where factorsToTry x = takeWhile (\p -> p*p <= x) primes

isPrime 1 = False
isPrime n = foldl (\a b -> a && (n `mod` b) > 0) True (takeWhile (\x -> x*x <= n) primes)




corners n inc = [x | x <- (n+inc):(n+2*inc):(n+3*inc):(n+4*inc):(corners (n+4*inc) (inc+2))]

spiralDiagonals 1 = [1]
spiralDiagonals n = let s = n * n
                        inc = n - 1
                        l = s : (s-inc) : (s-(2*inc)) : [s-(3*inc)]
                    in l ++ spiralDiagonals (n-2)



--spiralDiagonals n = takeWhile (<= n^2) (1:(corners 1 2))

primeRatio l = let n = length $ filter isPrime l
                   d = length l
               in (fromInteger $ toInteger n) / (fromInteger $ toInteger d)


find10 = acc 20000 30000
    where acc low high = if low == high
                         then low
                         else let mid = ((high + low) `div` 2)
                                  m = primeRatio $ spiralDiagonals mid
                         in if m > 0.1
                            then acc mid high
                            else acc low mid



--primeRatio $ spiralDiagonals 8000 = 0.115
--primeRatio $ spiralDiagonals 20000 = 0.1035
--primeRatio $ spiralDiagonals 30000 = ?