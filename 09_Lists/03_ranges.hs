-- >>> [1..10]
-- [1,2,3,4,5,6,7,8,9,10]

-- >>> enumFromTo 1 10
-- [1,2,3,4,5,6,7,8,9,10]


-- >>> [1,3..10]
-- [1,3,5,7,9]

-- >>> enumFromThenTo 1 3 10
-- [1,3,5,7,9]


-- >>> :t enumFrom
-- enumFrom :: Enum a => a -> [a]

-- >>> take 10 . enumFrom $ 5
-- [5,6,7,8,9,10,11,12,13,14]


-- >>> :i Enum
-- type Enum :: * -> Constraint
-- class Enum a where
--   succ :: a -> a
--   pred :: a -> a
--   toEnum :: Int -> a
--   fromEnum :: a -> Int
--   enumFrom :: a -> [a]
--   enumFromThen :: a -> a -> [a]
--   enumFromTo :: a -> a -> [a]
--   enumFromThenTo :: a -> a -> a -> [a]
--   {-# MINIMAL toEnum, fromEnum #-}
--   	-- Defined in ‘GHC.Enum’
-- instance Enum Double -- Defined in ‘GHC.Float’
-- instance Enum Float -- Defined in ‘GHC.Float’
-- instance Enum () -- Defined in ‘GHC.Enum’
-- instance Enum Bool -- Defined in ‘GHC.Enum’
-- instance Enum Char -- Defined in ‘GHC.Enum’
-- instance Enum Int -- Defined in ‘GHC.Enum’
-- instance Enum Integer -- Defined in ‘GHC.Enum’
-- instance Enum Ordering -- Defined in ‘GHC.Enum’
-- instance Enum a => Enum (Solo a) -- Defined in ‘GHC.Enum’
-- instance Enum Word -- Defined in ‘GHC.Enum’

-- >>> :i Ordering
-- type Ordering :: *
-- data Ordering = LT | EQ | GT
--   	-- Defined in ‘GHC.Types’
-- instance Bounded Ordering -- Defined in ‘GHC.Enum’
-- instance Enum Ordering -- Defined in ‘GHC.Enum’
-- instance Read Ordering -- Defined in ‘GHC.Read’
-- instance Ord Ordering -- Defined in ‘GHC.Classes’
-- instance Eq Ordering -- Defined in ‘GHC.Classes’
-- instance Monoid Ordering -- Defined in ‘GHC.Base’
-- instance Semigroup Ordering -- Defined in ‘GHC.Base’
-- instance Show Ordering -- Defined in ‘GHC.Show’

-- >>> enumFrom LT
-- [LT,EQ,GT]

data MySum = A | B | C | D deriving (Enum, Show)

-- >>> enumFrom B
-- [B,C,D]
