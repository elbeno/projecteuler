-- primes n = n : [x | x <- primes (n+1), x `mod` n /= 0]

primes = 2 : [x | x <- [3,5..], all (\p -> x `mod` p > 0) (factorsToTry x)]
    where factorsToTry x = takeWhile (\p -> p*p <= x) primes



firstPrimeFactor n = fPF (takeWhile (\p -> p*p <= n) primes)
    where fPF (x:xs) = if n `mod` x == 0
                       then x
                       else fPF xs
          fPF [] = n

primeFactors n = let p = firstPrimeFactor n
                 in if (p == n) 
                    then [p]
                    else p : primeFactors (n `div` p)


uniq [] = []
uniq [x] = [x]
uniq (x:y:xs) | x == y = uniq (y:xs)
              | otherwise = x : (uniq (y:xs))


answer = head [x | x <- [647..], (length $ uniq $ primeFactors x) >= 4,
               (length $ uniq $ primeFactors (x+1)) >= 4,
               (length $ uniq $ primeFactors (x+2)) >= 4,
               (length $ uniq $ primeFactors (x+3)) >= 4]

           