import qualified Data.Set as Set

primes = primes' 2
	where primes' n = n : [x | x <- primes' (n+1), x `mod` n /= 0]

primelist = takeWhile (<10000) primes

isPrime = (`Set.member` Set.fromList primelist)
	
--isPrime n = foldl (\a b -> a && (n `mod` b) > 0) True (takeWhile (\x -> x*x <= n) primes)

p a b c = isPrime a && isPrime b && isPrime c
f a b c = let la = sort $ numToList a
              lb = sort $ numToList b
              lc = sort $ numToList c
          in la == lb && lb == lc

numToList n | n < 10 = [n]
            | otherwise = (n `mod` 10) : (numToList (n `div` 10))
            
sort [] = []
sort (x:xs) = (sort $ filter (<x) xs) ++ [x] ++ (sort $ filter (>x) xs)

answers = [(a,b,c) | c <- primelist, b <- takeWhile (<c) primelist, a <- takeWhile (<b) primelist, b-a == c-b, f a b c]
