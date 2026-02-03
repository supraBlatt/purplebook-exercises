{-# OPTIONS_GHC -Wno-unused-top-binds #-}
{-# OPTIONS_GHC -Wno-missing-signatures #-}
{-# OPTIONS_GHC -Wno-compat-unqualified-imports #-}
{-# LANGUAGE TypeApplications #-}
import Test.QuickCheck
import Data.List

main :: IO ()
main = do
  -- quickCheck prop_halfTwo
  -- quickCheck prop_sortedListInt
  -- quickCheck prop_plusAssoc
  -- quickCheck prop_mulAssoc
  -- quickCheck prop_powAssocInt
  -- quickCheck (prop_listReverseId @Int)
  -- quickCheck prop_dollarSem_fromFun
  -- quickCheck (prop_foldrPlus @Int)
  -- quickCheck (prop_lmao @Int)
  -- quickCheck (prop_read @Int)
  quickCheck (prop_Idem2Sort @Int)

-- numbers 
half :: Fractional a => a -> a
half x = x / 2

halfIdentity :: Fractional a => a -> a
halfIdentity = (*2) . half

prop_halfTwo :: Property
prop_halfTwo = 
  forAll (arbitrary :: Gen Double) 
  (\x -> halfIdentity x == x)

-- lists 
listOrdered :: (Ord a) => [a] -> Bool
listOrdered xs = 
  snd $ foldr go (Nothing, True) xs
  where go _ status@(_, False) = status
        go y (Nothing, t) = (Just y, t)
        go y (Just x, _) = (Just y, x >= y)

prop_sortedList :: (Ord a) => [a] -> Bool
prop_sortedList l = if listOrdered l then sort l == l else sort l /= l

prop_sortedListInt :: [Int] -> Bool
prop_sortedListInt = prop_sortedList

-- assoc etc!

assoc f x y z = x `f` (y `f` z) == (x `f` y) `f` z
comm f x y = x `f` y == y `f` x 

prop_plusAssocInt :: Integer -> Integer -> Integer -> Bool
prop_plusAssocInt = assoc (+)

prop_mulAssocInt :: Integer -> Integer -> Integer -> Bool
prop_mulAssocInt = assoc (*)

prop_powAssocInt :: Integer -> Integer -> Integer -> Bool
prop_powAssocInt = assoc (^)

-- same for comm ^ 

-- functional equalities
prop_listReverseId :: Eq a => [a] -> Bool
prop_listReverseId l = (reverse . reverse) l == l 

prop_dollarSem :: Eq a => (p -> a) -> p -> Bool
prop_dollarSem f a = (f $ a) == f a

prop_dollarSem_fromFun :: Fun Int Int -> Int -> Bool
prop_dollarSem_fromFun fun p = prop_dollarSem (applyFun fun) p

prop_foldrPlus :: Eq a => [a] -> [a] -> Bool
prop_foldrPlus b l = foldr (:) b l == b ++ l

-- >>> foldr (:) [0] [1]
-- >>> [0] ++ [1]
-- [1,0]
-- [0,1]

prop_lmao :: Int -> [a] -> Bool
prop_lmao n xs = length (take n xs) == n

-- >>> length (take 1 [])
-- 0

prop_read :: (Eq a, Read a, Show a) => a -> Bool
prop_read x = (read (show x)) == x

square :: Num a => a -> a
square x = x * x

prop_sqrtId :: (Eq a, Floating a) => a -> Bool
prop_sqrtId x = (square . sqrt $ x) == x

-- >>> square . sqrt $ 0.2
-- 0.19999999999999998
-- lol rounding error

twice f = f . f
fourTimes = twice . twice

prop_Idem2 :: Eq a => (a -> a) -> a -> Bool
prop_Idem2 f x = (f x == twice f x) && (twice f x == fourTimes f x)

prop_Idem2Sort :: Ord a => [a] -> Bool
prop_Idem2Sort = prop_Idem2 sort