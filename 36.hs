numToList n b | n < b = [n]
              | otherwise = (n `mod` b) : (numToList (n `div` b) b)

isPalindrome l = l == reverse l

isPalBothBases n = (isPalindrome $ numToList n 10)
                   && (isPalindrome $ numToList n 2)

answer = sum $ filter isPalBothBases [1..999999]

{--

toBinary 0 = []
toBinary x = toBinary (div x 2) ++ [mod x 2]  
isPal x = (show x) == (reverse $ show x)
isBinaryPal x = (toBinary x) == (reverse $ toBinary x)
p36 = sum [ x | x <- [1..1000000], isPal x, isBinaryPal x]

--}