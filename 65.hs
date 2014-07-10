import Data.Char

fracparts :: [Integer]
fracparts = concat $ [2] : [ [1, n, 1] | n <- [2, 4..]]

setn :: Int -> [Integer]
setn n = reverse $ take n fracparts

f :: (Integer, Integer) -> Integer -> (Integer, Integer)
f (num, denom) fracpart = (num', denom')
    where denom' = denom * fracpart + num
          num' = denom

ans n = let s = setn n
            init_denom = head s
        in foldl f (1, init_denom) (tail s)

sumDigits n = sum $ map digitToInt (show n)

answer = sumDigits $ snd $ ans 100
