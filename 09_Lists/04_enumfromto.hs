-- eftBool :: Bool -> Bool -> [Bool]
-- eftBool b1 b2 = case (b1, b2) of
--                     (b, b) -> [b]
--                     (True, False) -> [True, False]
--                     _ -> []
                
eftBool :: Bool -> Bool -> [Bool]
eftBool b1 b2 = case (b1,b2) of
                    (False, False) -> [False]
                    (False, True)  -> [False, True]
                    (True, True)   -> [True]
                    _              -> []

-- I want to see enumFromTo's implementation for Bool
-- >>> :t enumFromTo
-- enumFromTo :: Enum a => a -> a -> [a]

-- >>> :i enumFromTo Bool
-- type Enum :: * -> Constraint
-- class Enum a where
--   ...
--   enumFromTo :: a -> a -> [a]
--   ...
--   	-- Defined in ‘GHC.Enum’
-- type Bool :: *
-- data Bool = False | True
--   	-- Defined in ‘GHC.Types’
-- instance Bounded Bool -- Defined in ‘GHC.Enum’
-- instance Enum Bool -- Defined in ‘GHC.Enum’
-- instance Eq Bool -- Defined in ‘GHC.Classes’
-- instance Ord Bool -- Defined in ‘GHC.Classes’
-- instance Read Bool -- Defined in ‘GHC.Read’
-- instance Show Bool -- Defined in ‘GHC.Show’

-- >>> eftBool False False
-- [False]
