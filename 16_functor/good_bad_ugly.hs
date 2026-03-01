-- food for thought : 
-- I don't understand how the peroperties of a functor
-- preserve structure. ID somehow prevents the structure from changing
-- while the composition prevents.. what exactly
-- it's hard for me to just accept it as is.
data WhoCares a = Doesnt | Matter a | What deriving(Eq, Show)

-- this one is fine
-- instance Functor WhoCares where
--   fmap _ Doesnt = Doesnt
--   fmap _ What = What
--   fmap f (Matter a) = Matter (f a)

-- this one is not, identity breaks
instance Functor WhoCares where 
  fmap _ Doesnt = What
  fmap f What = Doesnt
  fmap f (Matter a) = Matter (f a)

data Counting a = Heisenberg Int a deriving (Eq, Show)

-- this is also broken. both id and composition
-- as it messes WITH the STRUCTURE (f := Heisenberg n)
instance Functor Counting where
  fmap f (Heisenberg n a) = Heisenberg (n+1) (f a)

-- an annoying part with functors is that they can't map over 
-- structures like tuples in a nice way

-- >>> fmap (+1) (0, 0)
-- (0,1)

-- >>> :t fmap . fmap
-- fmap . fmap :: (Functor f1, Functor f2) => (a -> b) -> f1 (f2 a) -> f1 (f2 b)

-- >>> :t (.)
-- (.) :: (b -> c) -> (a -> b) -> a -> c

-- fmap1 :: Functor f => (a -> b) -> (f a -> f b)
-- fmap2 :: Functor f => (x -> y) -> (f x -> f y)
-- fmap2 . fmap1 
-- (a -> b) -> (f' (f a) -> f' (f b))
