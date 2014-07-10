corners n inc = [x | x <- (n+inc):(n+2*inc):(n+3*inc):(n+4*inc):(corners (n+4*inc) (inc+2))]

spiralDiagonals n = takeWhile (<= n^2) (1:(corners 1 2))

answer = sum $ spiralDiagonals 1001
