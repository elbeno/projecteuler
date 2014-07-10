import qualified Data.Set

pent = map (\x -> x * (3 * x - 1) `div` 2) [1..5000]

isPent = (`Data.Set.member` Data.Set.fromList pent)

answer = take 1 [a-b | a <- pent, b <- takeWhile (<a) pent, isPent (a-b), isPent (a+b)]

