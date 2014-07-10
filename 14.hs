collatzLengths = zip [1..] (map collatzLen [1..999999])

collatzLen n = acc n n
    where acc _ 1 = 1
          acc n n' = if n' < n
                     then snd $ collatzLengths !! (n'-1)
                     else let newn = if (n' `mod` 2 == 0)
                                     then n' `div` 2
                                     else 3 * n' + 1
                              in 1 + acc n newn

answer = foldl maxop (0,0) collatzLengths
    where maxop (ans,x) (n,l) = if x > l then (ans,x) else (n,l)








