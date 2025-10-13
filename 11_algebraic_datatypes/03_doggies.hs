data Doggies a =  Husky a
                | Mastiff a
                deriving (Eq, Show)

-- >>> :k Doggies
-- >>> :t Husky
-- Doggies :: * -> *
-- Husky :: a -> Doggies a

-- Doggies is a type constructor
-- >>> :k Doggies
-- >>> :k Doggies String
-- Doggies :: * -> *
-- Doggies String :: *

-- >>> :t Husky 10
-- >>> :t Husky (10 :: Integer)
-- Husky 10 :: Num a => Doggies a
-- Husky (10 :: Integer) :: Doggies Integer

-- >>> :t Mastiff "Scooby Doo"
-- Mastiff "Scooby Doo" :: Doggies String

--  DogueDeBordeaux a is both a type constructor AND a data constructor