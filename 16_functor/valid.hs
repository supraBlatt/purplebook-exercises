import GHC.Arr

data Bool' = False | True 
-- >>> :k Bool'
-- Bool' :: *
-- no functor!

data BoolAnd a = False' a | True' a
-- >>> :k BoolAnd
-- BoolAnd :: * -> *
-- yes functor!

data BoolAndMaybe a = Falsish | Truish a
-- >>> :k BoolAndMaybe
-- BoolAndMaybe :: * -> *
-- yes functor!

newtype Mu f = InF { outF :: f (Mu f)}
-- >>> :k Mu
-- Mu :: (* -> *) -> *
-- no functor??

data D = D (Array Word Word) Int Int

-- >>> :k D
-- D :: *
-- no functor!!

----------

data Sum b a = First a | Second b

instance Functor (Sum e) where
  fmap f (First a) = First (f a)
  fmap f (Second b) = Second b

data Company a c b = DeepBlue a c | Something b

instance Functor (Company e e') where
  fmap f (Something b) = Something (f b)
  fmap _ (DeepBlue a c) = DeepBlue a c

data More b a = L a b a | R b a b deriving (Eq, Show)

instance Functor (More x) where
  fmap f (L a b a') = L (f a) b (f a')
  fmap f (R b a b') = R b (f a) b'

-- >>> fmap (+1) (L 1 2 3)
-- L 2 2 4
-- >>> fmap (+1) (R 1 2 3)
-- R 1 3 3

-----------

data Quant a b = Finance | Desk a | Bloor b

instance Functor (Quant a) where
  fmap f (Bloor b) = Bloor (f b)
  fmap _ Finance = Finance
  fmap _ (Desk a) = Desk a

data K a b = K a 

instance Functor (K a) where
  fmap f (K a) = K a

newtype Flip f a b = Flip (f b a) deriving (Eq, Show)

-- im still a bit lost on that one
instance Functor (Flip K a) where
  fmap f (Flip (K b)) = Flip (K (f b))

data EvilGoateeConst a b = GoatyConst b

instance Functor (EvilGoateeConst a) where
  fmap f (GoatyConst b) = GoatyConst (f b)

-----------

data Lift f a = Lift (f a)

instance Functor f => Functor (Lift f) where
  fmap f (Lift fa) =  Lift (f <$> fa)

data Parappa f g a = DaWrappa (f a) (g a)

instance (Functor f, Functor g) => Functor (Parappa f g) where
  fmap f (DaWrappa fa ga) = DaWrappa (f <$> fa) (f <$> ga)

data Ignore f g a b = Ignore (f a) (g b)

instance Functor g => Functor (Ignore f g a) where
  fmap f (Ignore fa gb) = Ignore fa (f <$> gb)

data List a = Nil | Cons a (List a)

instance Functor List where
  fmap _ Nil = Nil
  fmap f (Cons x xs) = Cons (f x) (f <$> xs)

data GoatLord a = No | One a | More (GoatLord a) (GoatLord a)

instance Functor GoatLord where
  fmap _ No = No
  fmap f (One a) = One (f a)
  fmap f (More a1 a2) = More (f <$> a1) (f <$> a2)

data Talk a = Halt | Print String a | Read (String -> a)

instance Functor Talk where
  fmap _ Halt = Halt
  fmap f (Print s a) = Print s (f a)
  fmap f (Read fs) = Read (f . fs)
