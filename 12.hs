triangleNumbers = tail $ scanl (+) 0 [1..]

divisorsOf n = 1 : n : acc n 2
    where acc n d = if d*d > n
                    then []
                    else if n `mod` d == 0
                         then d : (n `div` d) : acc n (d+1)
                         else acc n (d+1)

triangleDivisors = map divisorsOf triangleNumbers

findFirst (x:xs) n = if length x > n
                     then x
                     else findFirst xs n

answer = head $ tail $ findFirst triangleDivisors 500
