fact n = product [1..n]

numToList n
    | n < 10 = [n]
    | n >= 10 = (n `mod` 10) : numToList (n `div` 10)

f n = sum $ (map fact (numToList n))

f' n = if f n == n then n else 0

ans = filter (>0) (map f' [3..])

answer = scanl (+) 0 ans
