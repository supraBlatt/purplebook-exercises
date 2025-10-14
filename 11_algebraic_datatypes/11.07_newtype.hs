{-# LANGUAGE GeneralizedNewtypeDeriving #-}

newtype Goats = Goats Int deriving (Eq, Show, TooMany) -- used the pragma to get Int's TooMany

newtype Cows = Cows Int deriving (Eq, Show)

tooManyGoats (Goats n) = n > 42

-- >>> tooManyGoats (Cows 43)
-- Couldn't match expected type `Goats' with actual type `Cows'
-- In the first argument of `tooManyGoats', namely `(Cows 43)'
-- In the expression: tooManyGoats (Cows 43)
-- In an equation for `it_a1A42': it_a1A42 = tooManyGoats (Cows 43)

class TooMany a where
  tooMany :: a -> Bool

-- >>> :t tooMany
-- tooMany :: TooMany a => a -> Bool

instance TooMany Int where
  tooMany n = n > 42

-- >>> tooMany (43 :: Int)
-- True

-- before implementing the TooMany Goats instance:
-- >>> tooMany (Goats (43 ::Int))
-- No instance for `TooMany Goats' arising from a use of `tooMany'
-- In the expression: tooMany (Goats (43 :: Int))

-- instance TooMany Goats where
--   tooMany (Goats n) = n > 43 -- can also use (tooMany n) to take Int's version

-- >>> tooMany (Goats 44)
-- True

type Goats1 = Int

-- >>> tooMany (43 :: Goats1)
-- True

-- instance TooMany Goats1 doesn't work
