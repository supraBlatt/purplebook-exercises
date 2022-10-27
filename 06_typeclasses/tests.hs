-- >>> :t (==)
-- (==) :: Eq a => a -> a -> Bool
data Trivial = Trivial'
-- >>> Trivial' == Trivial'
-- No instance for (Eq Trivial) arising from a use of ‘==’

instance Eq Trivial where 
                    Trivial' == Trivial' = True 
-- >>> Trivial' == Trivial'
-- True

data Identty a = Identty a 

-- forcing param to have Eq typeclass to be able to use ==
instance Eq a => Eq (Identty a) where 
    (==) (Identty v)  (Identty v') = v == v'

-- >>> :i Integral
-- class (Real a, Enum a) => Integral a where
-- instance Integral Word -- Defined in ‘GHC.Real’
-- instance Integral Integer -- Defined in ‘GHC.Real’
-- instance Integral Int -- Defined in ‘GHC.Real’

-- >>> :i Num
-- instance Num Word -- Defined in ‘GHC.Num’
-- instance Num Integer -- Defined in ‘GHC.Num’
-- instance Num Int -- Defined in ‘GHC.Num’
-- instance Num Float -- Defined in ‘GHC.Float’
-- instance Num Double -- Defined in ‘GHC.Float’

-- >>> :t quotRem
-- quotRem :: Integral a => a -> a -> (a, a)

-- >>> :t divMod
-- divMod :: Integral a => a -> a -> (a, a)

-- >>> :i Ord
-- class Eq a => Ord a where
--   {-# MINIMAL compare | (<=) #-}
-- instance Ord Integer -- Defined in ‘GHC.Integer.Type’
-- instance Ord a => Ord [a] -- Defined in ‘GHC.Classes’
-- instance Ord Word -- Defined in ‘GHC.Classes’
-- instance Ord Ordering -- Defined in ‘GHC.Classes’
-- instance Ord Int -- Defined in ‘GHC.Classes’
-- instance Ord Float -- Defined in ‘GHC.Classes’
-- instance Ord Double -- Defined in ‘GHC.Classes’
-- instance Ord Char -- Defined in ‘GHC.Classes’
-- instance Ord Bool -- Defined in ‘GHC.Classes’
