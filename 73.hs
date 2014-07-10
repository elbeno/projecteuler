f x = x `div` 3 + 1
g x = let n = x `mod` 2
      in x `div` 2 - (1-n)

fracs = [(x,y) | y <- [4..10000], x <- [f y .. g y], gcd x y == 1]

main = do putStr $ show $ length fracs
