f :: Num a => a -> a -> a
f x y = x + y + 3

-- >>> :t f 1
-- >>> :t f 1.5
-- f 1 :: Num a => a -> a
-- f 1.5 :: Fractional a => a -> a
