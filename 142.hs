isSquare n = acc n 1
    where acc n try | try*try == n = True
                    | try*try > n = False
                    | otherwise = acc n (try+1)

f x y z = isSquare (x+y)
          && isSquare (x-y)
          && isSquare (x+z)
          && isSquare (x-z)
          && isSquare (y+z)
          && isSquare (y-z)

p = [(x,y,z) | x <- [1..], y <- [(x+1)..], z <- [(y+1)..], f x y z]

answer = head p
