units = [0,3,3,5,4,4,3,5,5,4]
teens = [0,6,6,8,8,7,7,9,8,8]
tens = [0,3,6,6,5,5,5,7,6,6]
hundreds = 0 : map (+7) (tail units)

numToWordLength n = if n == 1000
                    then 11
                    else let n1 = n `mod` 10
                             n10 = (n `div` 10) `mod` 10
                             n100 = n `div` 100
                             u = units !! n1
                             ut = teens !! n1
                             t = tens !! n10
                             h = (hundreds !! n100) + (if (n > 100) && n `mod` 100 > 0 then 3 else 0)
                         in if t == 3 && u > 0
                            then h + ut
                            else h + t + u


answer = sum (map numToWordLength [1..1000])
