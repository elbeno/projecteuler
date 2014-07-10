threeDigits = [100..999]

allProducts (x:xs) ys
    = (map (*x) ys) ++ allProducts xs ys
allProducts [] ys = []

threeDigitProducts = allProducts threeDigits threeDigits

numToList n
    | n < 10 = [n]
    | n >= 10 = (n `mod` 10) : numToList (n `div` 10)

isPalindrome n = let l = numToList n
                 in if l == reverse l
                    then n
                    else 0

palindromes = filter (>0) (map isPalindrome threeDigitProducts)

answer = foldl maxOp 0 palindromes
    where maxOp x y = if x > y then x else y


