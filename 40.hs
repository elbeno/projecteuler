numToList' n | n < 10 = [n]
             | otherwise = (n `mod` 10) : numToList' (n `div` 10)

numToList n = reverse $ numToList' n

digit n = acc n 1
    where acc n x = let l = numToList x
                    in if (length l) > n
                       then l !! n
                       else acc (n-(length l)) (x+1)

answer = (digit 0)
         * (digit 9)
         * (digit 99)
         * (digit 999)
         * (digit 9999)
         * (digit 99999)
         * (digit 999999)
