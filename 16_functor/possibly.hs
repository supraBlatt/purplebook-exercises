import Control.Applicative (Const)
data Possibly a = LolNope | Yeppers a deriving (Eq, Show)

instance Functor Possibly where
  fmap _ LolNope = LolNope
  fmap f (Yeppers a) = Yeppers (f a)

-- (a -> F a) -> (a -> b) -> (a) -> F b 

data Sum a b = First a | Second b deriving (Eq, Show)

instance Functor (Sum a) where 
  fmap f (Second b) = Second (f b)
  fmap _ (First a) = First a

data Constant a b = Constant { getConstant :: a } deriving (Eq, Show)

instance Functor (Constant a) where
  fmap :: (b -> c) -> Constant a b -> Constant a c
  fmap _ (Constant a) = Constant a

a = Constant 4 :: Constant Int Int

-- >>> :t fmap show a
-- >>> :t fmap (+1) a
-- fmap show a :: Constant Int String
-- fmap (+1) a :: Constant Int Int

data Wrap f a = 
  Wrap (f a) 
  deriving (Eq, Show)

-- >>> :k Wrap
-- Wrap :: (k -> *) -> k -> *

-- >>> :t Wrap (Just (4::Int))
-- Wrap (Just (4::Int)) :: Wrap Maybe Int
  
instance Functor f => Functor (Wrap f) where
  fmap :: Functor f => (a -> b) -> Wrap f a -> Wrap f b
  fmap f (Wrap fa) = Wrap (f <$> fa)

-- >>> fmap (+1) (Wrap (Just 1))
-- Wrap (Just 2)
