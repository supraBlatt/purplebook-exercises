
-- partial. kinda dies for denom = 0
dividedBy :: (Integral a) => a -> a -> (a, a)
dividedBy num denom = go num denom 0
    where
        go n d count
            | n < d = (count, n)
            | otherwise = go (n - d) d (count + 1)

-- crude attempt to add division by zero. negatives not supported.
dividedBy' :: (Integral a) => a -> a -> DividedResult a
dividedBy' num denom = go num denom 0
    where
        go n d count
            | d == 0 = DividedByZero
            | n < d = Result (count, n)
            | otherwise = go (n - d) d (count + 1)

data DividedResult a = Result (a, a) | DividedByZero deriving Show

-- >>> dividedBy 9 7
-- (1,2)

-- >>>  dividedBy' (-10) 2
-- Result (0,-10)

-- >>> dividedBy 4 0
-- slowed my computer to a halt nice, didn't show bottom
-- >>> :t dividedBy (abs 1) (abs -3)