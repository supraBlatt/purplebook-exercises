module Optional (Optional) where

import Data.Monoid (Sum (..), Product (..))
import Data.Semigroup (Semigroup (..))

data Optional a = Nada | Only a 
  deriving (Eq, Show)

instance Semigroup a => Semigroup (Optional a) where
  l <> Nada = l
  Nada <> r = r
  Only a <> Only b = Only (a <> b)

instance Monoid a => Monoid (Optional a) where
  mempty = Nada

-- >>> Only (Sum 1) <> Only (Sum 1)
-- Only (Sum {getSum = 2})

-- >>> Only (Product 4) <> Only (Product 2)
-- Only (Product {getProduct = 8})

-- >>> Only [1] <> Nada
-- Only [1]

-- >>> Nada <> Only (Sum 1)
-- Only (Sum {getSum = 1})
