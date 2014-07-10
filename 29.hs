merge :: (Ord a) => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) = if x < y then x : merge xs (y:ys) else y : merge (x:xs) ys

uniq :: (Eq a) => [a] -> [a]
uniq [] = []
uniq [x] = [x]
uniq (x1:x2:xs) = if x1 == x2 then uniq (x2:xs) else x1 : uniq (x2:xs)

power :: (Num a) => a -> a -> a
power x 0 = 1
power x y = x * power x (y-1)

powersTo100 :: (Num a) => a -> [a]
powersTo100 n = let acc n 100 = [power n 100]
                    acc n i = (power n i) : acc n (i+1)		  
                in acc n 2

answerlist n | n == 100 = powersTo100 100
             | n < 100 = uniq ( merge (powersTo100 n) (answerlist (n+1)) )

answer = length $ answerlist 2
