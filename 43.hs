import Char

sort [] = []
sort (x:xs) = filter (<=x) xs ++ [x] ++ filter (>x) xs

removeDups [] = []
removeDups [x] = [x]
removeDups (x:y:xs) = if (x == y) 
					then removeDups (y:xs)
					else x : removeDups (y:xs)

allDiff [] = True
allDiff [x] = True
allDiff (x:xs) = (foldl (\a b -> a && (not . (==x)) b) True xs) && allDiff xs

seventeens = filter (allDiff . show) (map (*17) [6..58])
sevens = filter (allDiff . show) (map (*7) [15..142])
twos = filter (allDiff . show) (map (*2) [50..499])

isNotIn a = foldl (\x y -> x && (not . (==a)) (digitToInt y)) True
findNotIn 0 xs = ""
findNotIn n xs = if (isNotIn n xs) 
				then show n 
				else findNotIn (n-1) xs
findMissing xs = findNotIn 9 xs
addMissing xs = findMissing xs ++ xs

subString _ _ [] = []
subString _ 0 _ = []
subString 0 b (x:xs) = x : subString 0 (b-1) xs
subString a b (x:xs) = subString (a-1) b xs

cands = [(y++x) | x <- map show seventeens, y <- map show sevens, allDiff (y++x)]
cands2 = filter (\x -> (read (subString 1 3 x)::Integer) `mod` 11 == 0 && (read (subString 2 3 x)::Integer) `mod` 13 == 0) cands

cands3 = [(y++x) | x <- cands2, y <- map show twos, allDiff (y++x)]
cands4 = filter (\x -> (read (subString 1 3 x)::Integer) `mod` 3 == 0 && (read (subString 2 3 x)::Integer) `mod` 5 == 0) cands3

anslist = filter (\x -> length x == 10) (map addMissing cands4)

ans = sum $ removeDups $ sort (map (\x -> read x::Integer) anslist)