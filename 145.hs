f n = n + (read . reverse . show) n :: Integer

isOdd n = n == '1' || n == '3' || n == '5' || n == '7' || n == '9'

isReversible n = (n `mod` 10 > 0) && (filter isOdd l) == l
                 where l = show $ f n

cands = takeWhile (<100000) $ filter isReversible [10..]

answer = length cands


