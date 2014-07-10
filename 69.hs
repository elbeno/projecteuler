import List

primes :: [Integer]
primes = 2 : [x | x <- [3,5..], all (\p -> x `mod` p > 0) (factorsToTry x)]
    where factorsToTry x = takeWhile (\p -> p*p <= x) primes

firstPrimeFactor :: Integer -> Integer
firstPrimeFactor n = fPF (takeWhile (\p -> p*p <= n) primes)
    where fPF (x:xs) = if n `mod` x == 0
                       then x
                       else fPF xs
          fPF [] = n

primeFactors :: Integer -> [Integer]
primeFactors n = let p = firstPrimeFactor n
                 in if (p == n) 
                    then [p]
                    else p : primeFactors (n `div` p)

uniqPrimeFactors :: Integer -> [Integer]
uniqPrimeFactors n = nub $ primeFactors n

quickphi n = let n' = uniqPrimeFactors n
             in k * product (map (+(-1)) n')
                 where n' = uniqPrimeFactors n
                       k = n `div` product n'

f n = (n, (fromInteger n) / (fromInteger $ quickphi n))

maxop (n1, p1) (n2, p2) = if p1 > p2
                          then (n1, p1)
                          else (n2, p2)

ans [] acc = acc
ans (x:xs) acc = ans xs $! (maxop acc x)

answer x = do putStrLn $ show $ ans (map f [2..x]) (0,0)

main = answer 1000000

