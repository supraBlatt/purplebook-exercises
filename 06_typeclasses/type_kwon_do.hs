-- 1 
chk :: Eq b => (a -> b) -> a -> b -> Bool 
chk f a b = f a == b  
-- chk f a b = True also works? 

-- 2 
arith :: Num b => (a -> b) -> Integer -> a -> b 
arith f x a = f a + fromInteger x 

-- >>> :i Num
--   fromInteger :: Integer -> a
-- instance Num Integer -- Defined in ‘GHC.Num’

-- >>> :i Integer
-- instance Integral Integer -- Defined in ‘GHC.Real’

-- >>> :i fromIntegral
-- fromIntegral :: (Integral a, Num b) => a -> b
