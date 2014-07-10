fibs = 1 : 2 : zipWith (+) fibs (tail fibs)

fibsUnder1M = takeWhile (<1000000) fibs

evenFibsUnder1M = [x | x <- fibsUnder1M, x `mod` 2 == 0]

