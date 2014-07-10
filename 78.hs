fact 0 = 1
fact n = n * fact (n-1)

choose n r = (fact n) `div` (fact r) `div` (fact (n-r))
