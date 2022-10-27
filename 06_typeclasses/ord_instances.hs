data DayOfWeek = 
    Sun | Mon | Tue | Weds | Thu | Fri | Sat 
    deriving (Ord, Show, Eq)

-- >>> max (length [1]) (length [2])
-- 1

-- >>> :t (3 * 4)
-- >>> :t compare (3 * 4)
-- (3 * 4) :: Num a => a
-- compare (3 * 4) :: (Ord a, Num a) => a -> Ordering

-- >>> (5 + 3) > (3 + 6)
-- False

-- >>> :t print
-- print :: Show a => a -> IO ()
