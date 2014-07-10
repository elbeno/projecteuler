properDivisors n = 1 : acc n 2
    where acc n d = if d*d > n
                    then []
                    else if n `mod` d == 0
                         then d : (n `div` d) : acc n (d+1)
                         else acc n (d+1)

isAmicable n = let n' = sum $ properDivisors n
                   n'' = sum $ properDivisors n'
               in if (n'' == n && not (n' == n) && n < 10000)
                  then n
                  else 0

amicablesUnder10K = filter (>0) $ map isAmicable [1..10000]

answer = sum amicablesUnder10K


