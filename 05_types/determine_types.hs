{-# LANGUAGE NoMonomorphismRestriction #-}
-- 1. 
-- a
-- >>> :t (* 9) 6
-- (* 9) 6 :: Num a => a

-- b 
-- >>> :t head [(0, "doge"), (1, "kitteh")]
-- head [(0, "doge"), (1, "kitteh")] :: Num a => (a, [Char])

-- c 
-- >>> :t tail [(0 :: Integer, "doge"), (1, "kitteh")]
-- tail [(0 :: Integer, "doge"), (1, "kitteh")] :: [(Integer, [Char])]

-- d
-- >>> :t if False then True else False
-- if False then True else False :: Bool

-- e 
-- >>> :t length [1..5]
-- length [1..5] :: Int

-- f
-- >>> :t (length [1..4]) > (length "TACOCAT")
-- (length [1..4]) > (length "TACOCAT") :: Bool

-- 2. 
-- >>> x = 5
-- >>> y = x + 5
-- >>> :t y * 10
-- y * 10 :: Num a => a

-- 3.
-- >>> x = 5
-- >>> y = x + 5
-- >>> z y = y * 10 
-- >>> :t z
-- z :: Num a => a -> a

-- 4.
-- >>> x = 5
-- >>> y = x + 5 
-- >>> f = 4 / y 
-- >>> :t f
-- f :: Fractional a => a

-- 5.   
-- >>> x = "Julie"
-- >>> y = " <3 "
-- >>> z = "urmom"
-- >>> f = x ++ y ++ z 
-- >>> :t f
-- f :: [Char]
