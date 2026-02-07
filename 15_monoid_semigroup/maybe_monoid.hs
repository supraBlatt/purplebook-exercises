-- import doesnt work i couldnt care less to fix it so copy paste
import Data.Monoid (Sum (..), Product (..))
import Data.Semigroup (Semigroup (..))
import Test.QuickCheck

data Optional a = Nada | Only a 
  deriving (Eq, Show)

instance Semigroup a => Semigroup (Optional a) where
  l <> Nada = l
  Nada <> r = r
  Only a <> Only b = Only (a <> b)

instance Monoid a => Monoid (Optional a) where
  mempty = Nada

instance Arbitrary a => Arbitrary (Optional a) where
  arbitrary = oneof
    [ pure Nada
    , Only <$> arbitrary
    ]

-- exercise starts here
newtype First' a = First' {getFirst' :: Optional a}
  deriving (Eq, Show)

instance Semigroup(First' a) where
  First' (Only a) <> First' _ = First' (Only a)
  First' _ <> r = r 

instance Monoid (First' a) where
  mempty :: First' a
  mempty = First' Nada

instance Arbitrary(a) => Arbitrary(First' a) where
  arbitrary = First' <$> arbitrary

monoidAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
monoidAssoc a b c = a <> (b <> c) == (a <> b) <> c

monoidLeftIdentity :: (Eq m, Monoid m) => m -> Bool
monoidLeftIdentity a = mempty <> a == a

monoidRightIdentity :: (Eq m, Monoid m) => m -> Bool
monoidRightIdentity a = a <> mempty == a

type FirstMappend = First' String -> 
                    First' String -> 
                    First' String -> 
                    Bool

type FstId = First' String -> Bool

main = do 
  quickCheck (monoidAssoc :: FirstMappend)
  quickCheck (monoidLeftIdentity :: FstId)
  quickCheck (monoidRightIdentity :: FstId)