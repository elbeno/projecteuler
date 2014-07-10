{--
isProper x y = gcd x y == 1

reducedFracs d = filter (isProper d) [1..d]

numTo n = sum $ map (length . reducedFracs) [2..n]

ans = numTo 1000000
--}

import List
import System.Environment
import Data.List

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

numTo n = foldl' (+) 0 (map quickphi [1..n])

main = do 
  [d] <- map read `fmap` getArgs
  putStr $ show $ numTo d


