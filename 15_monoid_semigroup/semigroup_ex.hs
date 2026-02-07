import Test.QuickCheck
import Data.Semigroup
import GHC.IO.Handle.Text (memcpy)

semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = a <> (b <> c) == (a <> b) <> c

monoidLeftID :: (Eq m, Monoid m) => m  -> Bool
monoidLeftID a = mempty <> a == a

monoidRightID :: (Eq m, Monoid m) => m  -> Bool
monoidRightID a = a <> mempty == a

type Asc a = a -> a -> a -> Bool
type S = String

main :: IO ()
main = do
  -- quickCheck (semigroupAssoc :: Asc Trivial)
  -- quickCheck (semigroupAssoc :: Asc (Identity String))
  -- quickCheck (semigroupAssoc :: Asc (Two String [S]))
  -- quickCheck (semigroupAssoc :: Asc (Three String [S] S))
  -- quickCheck (semigroupAssoc :: Asc BoolConj)
  -- quickCheck (semigroupAssoc :: Asc BoolDisj)
  -- quickCheck (semigroupAssoc :: Asc (Or S S))
  -- quickCheck (semigroupAssoc :: Asc (Validation S S))
  -- quickCheck (semigroupAssoc :: Asc (AccBoth S S))
  return ()
  
-- 1. trivial
data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
  _ <> _ = Trivial

instance Arbitrary Trivial where
  arbitrary = return Trivial

instance Monoid Trivial where
  mempty = Trivial

-- 2. id
newtype Identity a = Identity a 
  deriving (Eq, Show)

instance Semigroup a => Semigroup(Identity a) where
 Identity a <> Identity b = Identity (a <> b)

instance Arbitrary a => Arbitrary(Identity a) where
  arbitrary = Identity <$> arbitrary

instance Monoid a => Monoid(Identity a) where
  mempty = Identity mempty

-- 3. two 
data Two a b = Two a b deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup(Two a b) where
  Two a1 b1 <> Two a2 b2 = Two (a1 <> a2) (b1 <> b2)

instance (Arbitrary a, Arbitrary b) => Arbitrary(Two a b) where
  arbitrary = Two <$> arbitrary <*> arbitrary

instance (Monoid a, Monoid b) => Monoid(Two a b) where
  mempty = Two mempty mempty

-- 4. three?
data Three a b c = Three a b c deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c) => Semigroup(Three a b c) where
  Three a1 b1 c1 <> Three a2 b2 c2 = Three (a1 <> a2) (b1 <> b2) (c1 <> c2)

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary(Three a b c) where
  arbitrary = Three <$> arbitrary <*> arbitrary <*> arbitrary

instance (Monoid a, Monoid b, Monoid c) => Monoid(Three a b c) where
  mempty :: (Monoid a, Monoid b, Monoid c) => Three a b c
  mempty = Three mempty mempty mempty

-- 5. Four, literally the same thing 

-- 6. conj
newtype BoolConj = BoolConj Bool
  deriving (Eq, Show)

instance Semigroup BoolConj where
  (BoolConj b1) <> (BoolConj b2) = BoolConj (b1 && b2)

instance Arbitrary BoolConj where
  arbitrary = BoolConj <$> arbitrary

instance Monoid BoolConj where
  mempty = BoolConj True

-- 7. disj
newtype BoolDisj = BoolDisj Bool
  deriving (Eq, Show)

instance Semigroup BoolDisj where
  (BoolDisj b1) <> (BoolDisj b2) = BoolDisj (b1 || b2)

instance Arbitrary BoolDisj where
  arbitrary :: Gen BoolDisj
  arbitrary = BoolDisj <$> arbitrary

instance Monoid BoolDisj where 
  mempty = BoolDisj False

-- 8. union 
data Or a b = Fst a | Snd b
  deriving (Eq, Show)

instance Semigroup(Or a b) where
  Snd b <> _ = Snd b
  _ <> r = r

instance (Arbitrary a, Arbitrary b)=>Arbitrary(Or a b) where
  arbitrary = oneof [Fst <$> arbitrary, Snd <$> arbitrary]

-- >>> Snd 1 <> Snd 2
-- Snd 1

-- 9. combine
newtype Combine a b = 
  Combine { unCombine :: (a -> b)}

instance (Semigroup b) => Semigroup(Combine a b) where
  Combine f <> Combine g = Combine (f <> g)

instance (CoArbitrary a, Arbitrary b) => Arbitrary (Combine a b) where
  arbitrary = Combine <$> arbitrary

instance (Monoid a, Monoid b) => Monoid (Combine a b) where
  mempty = Combine (const mempty) 

-- 10. comp
newtype Comp a = 
  Comp { unComp :: (a -> a) }

instance (Semigroup a) => Semigroup(Comp a) where
  Comp f <> Comp g = Comp (f . g)

instance (Monoid a) => Monoid (Comp a) where
  mempty = Comp id 

-- 11. validation
data Validation a b = Fail a | Suc b 
  deriving (Eq, Show)

instance Semigroup a => Semigroup (Validation a b) where
  Fail a <> Fail b = Fail (a <> b)
  Fail a <> _ = Fail a
  _ <> r = r

instance (Arbitrary a, Arbitrary b) => Arbitrary (Validation a b) where
  arbitrary = oneof [Fail <$> arbitrary, Suc <$> arbitrary]

-- 12
newtype AccRight a b = AccRight (Validation a b)

instance Semigroup b => Semigroup (AccRight a b) where
  AccRight (Suc a) <> AccRight (Suc b) = AccRight (Suc (a <> b))
  AccRight (Suc a) <> _ = AccRight (Suc a)
  _ <> r  = r

-- 13 
newtype AccBoth a b = AccBoth (Validation a b)
  deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (AccBoth a b) where
  AccBoth (Suc a) <> AccBoth (Suc b) = AccBoth (Suc (a <> b))
  AccBoth (Fail a) <> AccBoth (Fail b) = AccBoth (Fail (a <> b))
  _ <> AccBoth (Suc b)  = AccBoth (Suc b)
  AccBoth (Suc a) <> _ = AccBoth (Suc a) 

instance (Arbitrary a, Arbitrary b) => Arbitrary (AccBoth a b) where
  arbitrary = AccBoth <$> arbitrary

-- mem
newtype Mem s a = Mem { runMem :: s -> (a, s) }

instance Semigroup a => Semigroup (Mem s a) where
  Mem f <> Mem g = Mem $ \s ->
        let (a1, s1) = g s
            (a2, s2) = f s1 
        in  (a1 <> a2, s2)

instance Monoid a => Monoid (Mem s a) where
  mempty = Mem (\s -> (mempty, s))

f' :: Mem Integer String
f' = Mem $ \s -> ("hi", s + 1)

-- >>> runMem (mempty <> f') 0
-- ("hi",1)

-- >>> runMem (f' <> mempty) 0
-- ("hi",1)

-- >>> runMem mempty 0 :: (String, Int)
-- ("",0)

-- >>> runMem (f' <> mempty) 0 == runMem f' 0
-- True

-- >>> runMem (mempty <> f') 0 == runMem f' 0
-- True