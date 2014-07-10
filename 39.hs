findPyth n = findPyth2 n (n+1)
    where findPyth2 a b = if (a + b > 1000)
                          then []
                          else let c2 = a^2 + b^2
                                   c = sqrt $ fromInteger c2
                                   frac = properFraction c
                               in if snd frac == 0
                                  then [a, b, (fst frac)] : (findPyth2 a (b+1))
                                  else findPyth2 a (b+1)

f n ([a,b,c]:l) = if (a+b+c == n) 
                  then [a,b,c] : (f n l)
                  else f n l
f _ [] = []

f' x = not (x == [])

perimeterSolutions n = filter f' (map (f n) (map findPyth [1..n]))

answer = perimeterSolutions 840

{--
import Data.List

listsEqual xs ys = fromList xs == fromList ys

list = [ (a:b:c:[])| a <- [1..500], b <- [a..500], c<-[b..a+b], a^2 + b^2 == c^2]

numberOf p list = length [ t | t<-list, sum t == p ]

solution = last $ sort [ (numberOf p list,p) | p <- [1..1000]]
--}
