numToList n
    | n < 10 = [n]
    | n >= 10 = (n `mod` 10) : numToList (n `div` 10)

answer = sum $ numToList $ product [1..100]