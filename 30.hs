numToList n
    | n < 10 = [n]
    | n >= 10 = (n `mod` 10) : numToList (n `div` 10)

power4 n = n * n * n * n
power5 n = n * n * n * n * n

isSumOfPower4Digits n = n == (sum $ map power4 (numToList n))
isSumOfPower5Digits n = n == (sum $ map power5 (numToList n))

power4Sums = filter isSumOfPower4Digits [2..]
power5Sums = filter isSumOfPower5Digits [2..]

answer = scanl (+) 0 power5Sums
