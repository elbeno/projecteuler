findPyth n = findPyth2 n (n+1)
    where findPyth2 a b = if (a + b > 1000)
                          then []
                          else let c2 = a^2 + b^2
                                   c = sqrt $ fromInteger c2
                                   frac = properFraction c
                               in if snd frac == 0
                                  then [a, b, (fst frac)] : (findPyth2 a (b+1))
                                  else findPyth2 a (b+1)

f ([a,b,c]:l) = (a + b + c == 1000) || f l
f [] = False

triplets = filter f (map findPyth [100..500])
                                   
