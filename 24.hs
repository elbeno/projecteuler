import Data.List

permute :: String -> [String]
permute [] = [[]]
permute str = do
   x  <- str
   xs <- permute (delete x str)
   return (x:xs)

answer = (permute "0123456789") !! 999999
