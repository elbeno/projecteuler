import List
import System.Environment

isBouncy n = let ns = show n
                 a = sort ns
                 b = reverse a
             in (ns /= a) && (ns /= b)

intToFloat n = fromInteger (toInteger n)

numBouncy n = length $ filter isBouncy [1..n]

bouncyOver p n = (numBouncy n) * 100 == n * p

main = do
  [d] <- map read `fmap` getArgs
  putStr $ show $ bouncyOver 99 d

