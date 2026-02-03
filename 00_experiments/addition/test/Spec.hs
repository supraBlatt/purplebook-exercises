{-# OPTIONS_GHC -Wno-type-defaults #-}

import Test.Hspec
import Test.QuickCheck
import Lib (dividedBy)

main :: IO ()
main = hspec $ describe "Addition" $ do
  it "15 divided by 3 is 5" $
    dividedBy 15 3 `shouldBe` (5,0)
  it "22 divided by 5 is 4 remainder 2" $
    dividedBy 22 5 `shouldBe` (4, 2)
  it "x+1 greater than x" $
    property $ \x -> x +1 > (x::Int)


-- >>> :i Gen
-- type Gen :: * -> *
-- newtype Gen a = MkGen {unGen :: QCGen -> Int -> a}

-- >>> :t arbitrary
-- arbitrary :: Arbitrary a => Gen a

trivialInt :: Gen Int
trivialInt = return 1

-- >>> sample' trivialInt
-- [1,1,1,1,1,1,1,1,1,1,1]

oneThroughThree :: Gen Integer
oneThroughThree = elements [1,2,2,2,2,3]

-- >>> sample' oneThroughThree
-- [1,2,2,2,3,2,2,2,2,3,2]

genBool :: Gen Bool
genBool = choose (False, True)

-- >>> sample' genBool 
-- [True,False,True,True,True,False,True,True,True,True,True]


genTuple:: (Arbitrary a, Arbitrary b) => Gen (a,b)
genTuple = do 
  a <- arbitrary
  b <- arbitrary
  return (a,b)

-- >>> sample' genTuple
-- [((),()),((),()),((),()),((),()),((),()),((),()),((),()),((),()),((),()),((),()),((),())]

-- >>> sample' (genTuple :: Gen (Int, Float))
-- [(0,0.0),(-1,0.0),(4,2.0),(1,-6.0),(8,7.0),(-10,0.39200526),(8,-0.5),(14,1.5),(-14,-5.857143),(13,-0.25),(-2,7.582408e-2)]

-- >>> :i Arbitrary
-- a load of available types

genEither :: (Arbitrary a, Arbitrary b) => Gen (Either a b)
genEither = do
  a <- arbitrary
  b <- arbitrary
  elements [Left a, Right b]

prop_additionGreater :: Int -> Bool
prop_additionGreater x = x + 1 > x

runQc :: IO ()
runQc = quickCheck prop_additionGreater
