import Char

f n = sum (map ((^2) . digitToInt) (show n))

nlist = [1..1000000]

squares = [x * x | x <- [1..]]

issquare n = let l = takeWhile (<= n) squares
             in last l == n

squaresum = sum $ filter issquare (map f nlist)

