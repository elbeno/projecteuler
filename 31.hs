coins = [200,100,50,20,10,5,2,1]

numways n [] = 0
numways 0 _ = 1
numways n (x:xs) | n < 0 = 0
                 | n > 0 = numways (n-x) (x:xs)
                           + numways n xs

answer = numways 200 coins
