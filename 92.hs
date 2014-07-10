numToList n | n < 10 = [n]
            | otherwise = (n `mod` 10) : (numToList (n `div` 10))

sumSquareDigits n = sum $ map (^2) (numToList n)

chainEnd 1 = 1
chainEnd 89 = 89
chainEnd n = chainEnd $ sumSquareDigits n
           
ans (n:ns) = let i = chainEnd n
             in if i == 89
                then 1 + (ans ns)
                else ans ns
ans [] = 0
                
answer = ans [1..9999999]

	