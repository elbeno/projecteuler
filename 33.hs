sort [] = []
sort [a] = [a]
sort (a:as) = (sort $ filter (<a) as) ++ [a] ++ (sort $ filter (>a) as)

merge :: (Ord a) => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) = if x < y then x : merge xs (y:ys) else y : merge (x:xs) ys

uniq :: (Eq a) => [a] -> [a]
uniq [] = []
uniq [x] = [x]
uniq (x1:x2:xs) = if x1 == x2 then uniq (x2:xs) else x1 : uniq (x2:xs)

denominators = [10..99]
fracs = [(a,b) | b <- denominators, a <- denominators, a < b]
nontrivfracs = filter (\(a,b) -> ((a `mod` 10) > 0) || ((b `mod` 10) > 0)) fracs

numToList 0 = []
numToList n = (n `mod` 10) : numToList (n `div` 10)

listToNum [] = 0
listToNum (n:ns) = n + 10 * (listToNum ns)

contains' n [] = False
contains' n (b:bs) = n == b || contains' n bs

contains [] bs = False
contains (a:as) bs = contains' a bs || contains as bs

canCancel (as,bs) = let as' = sort as
                        bs' = sort bs
                    in (length . uniq) (merge as bs) < (length as) + (length bs)
                       && contains as bs

cancel ([x1,x2],[y1,y2]) | x1 == y1 = ([x2],[y2])
                         | x1 == y2 = ([x2],[y1])
                         | x2 == y1 = ([x1],[y2])
                         | x2 == y2 = ([x1],[y1])

cancellablesList = filter canCancel (map (\(x,y) -> (numToList x, numToList y)) nontrivfracs)
cancelled' = map cancel cancellablesList

unzipLists = (\(x,y) -> (listToNum x, listToNum y))

cancelled = map unzipLists cancelled'
preCancelled = map unzipLists cancellablesList

checklist = zip preCancelled cancelled

f ((a,b),(x,y)) = (fromInteger a) / (fromInteger b) == (fromInteger x)/(fromInteger y)

answerlist = filter f checklist

answerlist' = fst $ unzip answerlist
answerlist'' = unzip answerlist'

answer = (product $ fst answerlist'', product $ snd answerlist'')

-- and then just reduce the fraction

