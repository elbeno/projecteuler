cubes = [x*x*x | x <- [345..10000]]

sort [] = []
sort (x:xs) = (sort $ filter (<=x) xs) ++ [x] ++ (sort $ filter (>x) xs)

sortedcubes = zip cubes (map (sort . show) cubes)

f comp x' (y,y') = comp x' y'

sort' [] = []
sort' ((c,c'):cs)
 = (sort' $ filter (f (>) c') cs)
   ++ [(c,c')]
   ++ (sort' $ filter (f (<=) c') cs)

resortedcubes = sort' sortedcubes

find5 [a, b, c, d] = []
find5 ((a,a'):(b,b'):(c,c'):(d,d'):(e,e'):fs)
    = if and [(a' == b'), (b' == c'), (c' == d'), (d' == e')]
      then [(a, a'), (b,b'), (c,c'), (d,d'), (e,e')]
      else find5 ((b,b'):(c,c'):(d,d'):(e,e'):fs)

find3 [a, b] = []
find3 ((a,a'):(b,b'):(c,c'):fs)
    = if and [(a' == b'), (b' == c')]
      then [(a, a'), (b,b'), (c,c')]
      else find3 ((b,b'):(c,c'):fs)

answer = find5 resortedcubes

main = do putStr $ show $ answer
