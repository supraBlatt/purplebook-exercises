-- {-# LANGUAGE FlexibleInstances #-}
class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

instance TooMany String where
  tooMany s = True

instance TooMany (Int, String) where
  tooMany (n, _) = tooMany n

-- >>> tooMany (44 ::Int, "hi")
-- No instance for `TooMany (Int, String)'
--   arising from a use of `tooMany'
-- In the expression: tooMany (44 :: Int, "hi")
-- In an equation for `it_a2x94': it_a2x94 = tooMany (44 :: Int, "hi")

newtype Tup = Tup (Int, String) deriving (Eq, Show, TooMany)

-- >>> tooMany $ Tup (44, "hi")
-- True

instance TooMany (Int, Int) where
  tooMany (n1, n2) = tooMany (n1 + n2)