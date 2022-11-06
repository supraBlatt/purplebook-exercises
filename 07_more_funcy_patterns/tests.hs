-- brr ignoring hints
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use if" #-}
{-# HLINT ignore "Collapse lambdas" #-}
{-# HLINT ignore "Redundant lambda" #-}
{-# HLINT ignore "Avoid lambda using `infix`" #-}

a = (\x -> x * 3) :: Integer -> Integer

-- >>> a $ 5
-- 15

mTh :: Num a => a -> a -> a -> a
mTh = \x -> \y -> \z -> x * y * z
-- >>> :t mTh 3 
-- mTh 3 :: Num a => a -> a -> a

-- change f n to f = \x -> x + 1
addOneIfOdd n = case odd n of 
                True -> f n 
                False -> n 
                where f n = n + 1




