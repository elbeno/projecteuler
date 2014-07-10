numToList n | n < 10 = [n]
            | otherwise = (n `mod` 10) : (numToList (n `div` 10))

listToNum [] = 0
listToNum (n:ns) = n + (10*(listToNum ns))

isPalindrome n = let l = numToList n
                 in l == (reverse l)

nextNum n = n + (listToNum $ reverse $ numToList n)

isNotLychrel n = acc (nextNum n) 0
    where acc _ 50 = False
          acc n x = isPalindrome n
                    || acc (nextNum n) (x + 1)

answer = length $ filter (not . isNotLychrel) [1..9999]
