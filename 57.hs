
count_digits n = if n <= 9
                 then 1
                 else 1 + count_digits (n `div` 10)

next_den n d = n + d
next_num n d = n + (2*d)


count_fracs sofar count n d 
    = if count == 1000
      then sofar
      else if (count_digits n) > (count_digits d)
           then count_fracs (sofar+1) (count+1) (next_num n d) (next_den n d)
           else count_fracs sofar (count+1) (next_num n d) (next_den n d)

problem57 = count_fracs 0 1 3 2
