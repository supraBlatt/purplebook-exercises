-- 1
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use if" #-}
tensDigit :: Integral p => p -> p
tensDigit x = d 
              where xLast = x `div` 10 
                    d     = xLast `mod` 10 

-- >>> :i div
-- class (Real a, Enum a) => Integral a where
--   div :: a -> a -> a

-- >>> :i divMod
-- class (Real a, Enum a) => Integral a where
--   divMod :: a -> a -> (a, a)

-- only divMod? no problem.
tensDigit' :: Integral p => p -> p
tensDigit' = snd . flip divMod 10 . fst . flip divMod 10

tensDigit'' :: Integral a => a -> a
tensDigit'' x = x `div` 10 `mod` 10 

-- hundos 
hunsD x = d2 
          where xLast = x `div` 10 `div` 10 
                d2    = xLast `mod` 10

-- 2
foldBool1 :: a -> a -> Bool -> a 
foldBool1 x y b = case b of 
                  True -> x 
                  False -> y 

foldBool2 :: a -> a -> Bool -> a
foldBool2 x y b 
          | b == True  = x 
          | b == False = y

-- 3 
g :: (a -> b) -> (a, c) -> (b, c) 
g f (x, y) = (f x, y)

-- 4
