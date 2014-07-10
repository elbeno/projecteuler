addlines [] _ = []
addlines _ [] = []
addlines ((a,b):ps) (l:ls) = if a > b
                             then (l + a) : addlines ps ls
                             else (l + b) : addlines ps ls


combinelines l1 l2 = let l1' = (head l1 : l1) ++ [last l1]
                         l1'' = zip l1' (tail l1')
                     in addlines l1'' l2


lmax l = foldl f 0 l
    where f x y = if x > y then x else y

answer = do l <- readFile "triangle.txt" 
            let numbers = map toIntList (lines l)
            print $ lmax $ foldl combinelines (head numbers) (tail numbers)

toIntList s = let n = reads s :: [(Int, String)]
              in if n == []
                 then []
                 else let pair = head n
                          num = fst pair
                          str = snd pair                                
                      in num : toIntList str 

