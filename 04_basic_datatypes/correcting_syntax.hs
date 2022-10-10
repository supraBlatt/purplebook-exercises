{-# OPTIONS_GHC -Wno-overlapping-patterns #-}
x = (+) 

-- conversly we could just use f xs = length xs + 1 
f xs = x w 1
       where w = length xs

-- conversly f x = fst x 
f1 (a, b) = a

-- >>> :t (==)
-- (==) :: Eq a => a -> a -> Bool
-- >>> :t fst
-- fst :: (a, b) -> a
-- >>> :t (+)
-- (+) :: Num a => a -> a -> a
