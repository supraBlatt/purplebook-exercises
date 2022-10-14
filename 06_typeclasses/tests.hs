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

