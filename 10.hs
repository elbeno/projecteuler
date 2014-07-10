-- primes n = n : [x | x <- primes (n+1), x `mod` n /= 0]

primes = 2 : [x | x <- [3,5..], all (\p -> x `mod` p > 0) (factorsToTry x)]
    where factorsToTry x = takeWhile (\p -> p*p <= x) primes

answer = sum $ takeWhile (<1000000) primes

main = putStrLn (show answer)

