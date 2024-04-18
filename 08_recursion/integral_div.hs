
-- partial. kinda dies for denom = 0
dividedBy :: (Integral a) => a -> a -> (a, a)
dividedBy num denom = go num denom 0
    where
        go n d count
            | n < d = (count, n)
            | otherwise = go (n - d) d (count + 1)

-- >>> dividedBy 9 7
-- (1,2)

-- >>> dividedBy 4 0
-- slowed my computer to a halt nice, didn't show bottom
-- >>> :t dividedBy (abs 1) (abs -3)

mcCarthy x 
    | x > 100 = x - 10 
    | otherwise = mcCarthy . mcCarthy $ x + 11 

