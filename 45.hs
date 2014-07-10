tri n = n * (n+1) `div` 2
pent n = n * (3*n-1) `div` 2
hex n = n * (2*n-1)

findTHP (t:ts) (p:ps) (h:hs)
    | t == p && t == h = t
    | t < p && t < h = findTHP ts (p:ps) (h:hs)
    | p < t && p < h = findTHP (t:ts) ps (h:hs)
    | h < t && h < p = findTHP (t:ts) (p:ps) hs
    | t < p = findTHP ts (p:ps) hs
    | t < h = findTHP ts ps (h:hs)

tris = map tri [286..]
pents = map pent [166..]
hexes = map hex [144..]

answer = findTHP tris pents hexes



