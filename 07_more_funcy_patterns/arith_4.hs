
roundTrip :: (Show a, Read a) => a -> a 
roundTrip = read . show 

roundTrip' :: (Show a, Read b) => a -> b
roundTrip' = read . show

-- >>> :i Char
-- >>> :i []
-- instance Read Char -- Defined in ‘GHC.Read’
-- instance Read a => Read [a] -- Defined in ‘GHC.Read’

-- >>> :t read 
-- >>> :t show
-- read :: Read a => String -> a
-- show :: Show a => a -> String

-- >>> roundTrip' 4 :: Integer
-- 4

