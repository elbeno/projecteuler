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

isPermutation (x, y) = (sort $ show x) == (sort $ show y)

phiPerms n = filter isPermutation $ zip [1..] (map quickphi [1..n])


-- x/px < y/py => x*py < y*px
f (x,px) (y,py)
 = if (x*py < y*px)
   then LT
   else GT

answer n = head $ sortBy f (phiPerms n)

main = do 
  [d] <- map read `fmap` getArgs
  putStr $ show $ answer d


