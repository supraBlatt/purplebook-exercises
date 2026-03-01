import Test.QuickCheck

main :: IO ()
main = do
  return ()

newtype Identity a = Identity a
instance Functor Identity where
  fmap f (Identity a) = Identity (f a) 


data Pair a = Pair a a

data Two a b = Two a b

data Three a b c = Three a b c

data Three' a b = Three' a b b

data Four a b c d = Four a b c d

data Four' a b = Four' a a a b


