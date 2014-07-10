fact n = product [1..n]

choose n r = (fact n) `div` ((fact r) * fact (n-r))

answerlist = [(choose a b) | a <- [1..100], b <- [2..(a-1)]]

answer = length $ filter (>1000000) answerlist
