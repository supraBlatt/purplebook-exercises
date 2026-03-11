import Control.Applicative (liftA3)

data Pair a = Pair a a deriving Show

instance Functor Pair where
  fmap f (Pair a1 a2) = Pair (f a1) (f a2)

instance Applicative Pair where
  pure a = Pair a a
  (Pair f1 f2) <*> (Pair a1 a2) = Pair (f1 a1) (f2 a2)

data Two a b = Two a b
instance Functor (Two a) where
  fmap f (Two a b) = Two a (f b)

-- has to be a monoid??
instance Monoid a => Applicative (Two a) where
  pure b = Two mempty b
  (Two a1 f) <*> (Two a2 b) = Two (a1 <> a2) (f b)

---------------

stops = "pbtdkg"
vowels = "aeiou"

combos :: [a] -> [b] -> [c] -> [(a,b,c)]
combos = liftA3 (,,)
