import Text.Read (Lexeme(Ident))
import Data.Monoid (Sum (Sum))
import Control.Applicative (liftA3)

newtype Identity a = Identity a deriving (Eq, Ord, Show)

instance Functor Identity where
  fmap f (Identity a) = Identity (f a)

instance Applicative Identity where
  pure a = Identity a
  (Identity f) <*> (Identity a) = Identity (f a)

-- >>> const <$> Identity [1..3] <*> Identity [9,9,9]
-- Identity [1,2,3]

---------------------------------

newtype Constant a b = Constant {getConstant :: a} deriving (Eq, Ord, Show)

instance Functor (Constant a) where
  fmap :: (b -> c) -> Constant a b -> Constant a c 
  fmap _ (Constant a) = Constant a

instance Monoid a => Applicative (Constant a) where 
  pure _ = Constant mempty 
  (Constant a1) <*> (Constant a2) = Constant (a1 <>  a2)

-- >>> Constant (Sum 1) <*> Constant (Sum 2)
-- Constant {getConstant = Sum {getSum = 3}}

-- >>> pure 1 :: Constant String Int
-- Constant {getConstant = ""}

--------------------------------------------

validateLength maxLen s = 
  if (length s) > maxLen
    then Nothing
    else Just s

newtype Name = Name String deriving (Eq, Show)
newtype Address = Address String deriving (Eq, Show)

mkName = fmap Name . validateLength 25
mkdAddress = fmap Address . validateLength 100

data Person = Person Name Address deriving (Eq, Show)
mkPerson n a = liftA2 Person (mkName n) (mkdAddress a)

------------------

data Cow = Cow {
  name :: String,
  age :: Int,
  weight :: Int
  } deriving (Eq, Show)

noEmpty "" = Nothing
noEmpty str = Just str

noNegative n | n >= 0 = Just n
             | otherwise = Nothing

cowFromStr n a w = liftA3 Cow (noEmpty n) 
                              (noNegative a) 
                              (noNegative w)

-- >>> cowFromStr "moo" 2 3
-- Just (Cow {name = "moo", age = 2, weight = 3})

-----------------

a = const <$> Just "Hi" <*> pure "World"
-- >>> a
-- Just "Hi"

b = (,,,) <$> Just 90 <*> Just 10 <*> Just "Tierness" <*> pure [1,2,3]
-- >>> b
-- Just (90,10,"Tierness",[1,2,3])
