{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use if" #-}

funcZ :: (Eq a, Num a) => a -> [Char]
funcZ x = 
    case x + 1 == 1 of 
        True -> "Awesome"
        False -> "Wut"

-- alternative without case expressions
funcZ' :: (Eq a, Num a) => a -> [Char]
funcZ' x = if x+1 == 1 then "Awesome" else "Wut"

-- palindrome
pal :: Eq a => [a] -> [Char]
pal xs = 
    case xs == reverse xs of 
        True -> "yes"
        False -> "no"

-- alternative approach. kinda cumbersome
pal' :: Eq a => [a] -> [Char]
pal' xs = 
    case y of 
        True -> "yes"
        False -> "no"
    where y = xs == reverse xs

-- exercises 
funcionC :: Ord p => p -> p -> p
funcionC x y = 
    case x > y of 
        True -> x 
        False -> y 

ifEvenAdd2 :: Integral p => p -> p
ifEvenAdd2 n = 
    case even n of 
        True -> n + 2
        False -> n
-- >>> :i even
-- even :: Integral a => a -> Bool 	-- Defined in ‘GHC.Real’

-- >>> :t compare
-- compare :: Ord a => a -> a -> Ordering
-- >>> :i Ordering
-- data Ordering = LT | EQ | GT
nums :: (Ord a, Num a, Num p) => a -> p
nums x = 
    case compare x 0 of 
        LT -> -1 
        GT -> 1 
        EQ -> 0
-- >>> nums 0
-- >>> nums 122
-- 0
-- 1