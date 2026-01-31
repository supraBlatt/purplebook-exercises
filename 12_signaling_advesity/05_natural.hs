import Data.Maybe
data Nat
  = Zero
  | Succ Nat
  deriving (Eq, Show)

natToInteger Zero     = 0
natToInteger (Succ n) = 1 + natToInteger n

-- >>> natToInteger (Succ (Succ Zero))
-- 2

-- i love functors
integerToNat :: Integer -> Maybe Nat
integerToNat n
  | n < 0     = Nothing
  | n == 0    = Just Zero
  | otherwise = Succ <$> integerToNat (n - 1)

-- >>> integerToNat 2
-- >>> integerToNat (-1)
-- Just (Succ (Succ Zero))
-- Nothing
