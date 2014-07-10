primes = primes' 2
	where primes' n = n : [x | x <- primes' (n+1), x `mod` n /= 0]
	
isPrime n = foldl (\a b -> a && (n `mod` b) > 0) True (takeWhile (\x -> x*x <= n) primes)

coeffs = [(a,b) | a <- [-999..999], b <- [-999..999]]

quadPrime n (a,b) = let x = (n*n + (a*n) + b)
					in x > 1 && isPrime x

numPrimes (a,b) = acc (a,b) 0
	where acc (a,b) n = if quadPrime n (a,b) 
	                    then 1 + acc (a,b) (n+1) 
	                    else 0
		
primeNums = filter (\((c1,c2),n) -> n > 40) (zip coeffs (map numPrimes coeffs))

maxList l = foldl maxop ((0,0),0) l
	where maxop (x,xn) (y,yn) = if xn > yn then (x,xn) else (y,yn)
	
answer = maxList primeNums

