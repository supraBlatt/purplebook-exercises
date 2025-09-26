{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}

foldr' f z [] = z
foldr' f z (x:xs) = f x (foldr' f z xs)

-- we are abstracting a pattern we saw before from many examples 'symbolically'

sum' [] = 0
sum' (x:xs) = x + sum' xs

product' [] = 1
product' (x:xs) = x * product' xs

length' [] = 0
length' (_:xs) = 1 + length' xs

-- all of these abstract to foldr
-- with a different neutral element z, and operation f

-- we can further abstract this at the structural level
-- to anything that can be folded

-- foldr is like replacing the cons : with the operator.
-- a0 : (a1 : (a2 : ...: an : [])..)
-- a0 + (a2 + .. + (an + z))..)

xs = map show [1..5]
-- >>> xs
-- ["1","2","3","4","5"]

zr = foldr (\x y -> concat ["(", x, "+", y, ")"]) "0" xs
-- >>> zr
-- "(1+(2+(3+(4+(5+0)))))"

-- evaluating foldr' with something like (+) as f
-- forces the next evaluation of foldr' down the list
-- because (+) is STRICT in both arguments.

-- this does not apply to stuff like (\x.\y . x)
-- for instance here even stops evaluating 'b' when it hits 2
-- even if the list [1..] is infinite

zeven = myAny even [1..]
    where myAny f = foldr (\x b -> f x || b) False

-- >>> zeven
-- True
