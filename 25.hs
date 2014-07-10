fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

numToList n
    | n < 10 = [n]
    | n >= 10 = (n `mod` 10) : numToList (n `div` 10)

fibLengths = zip [1..] (map (length . numToList) fibs)

answer = (+1) $ fst $ last $ takeWhile (\(x,y) -> y < 1000) fibLengths





