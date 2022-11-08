-- >>> negate . sum $ [1, 2, 3, 4, 5]
-- -15

-- >>> :i (.)
-- (.) :: (b -> c) -> (a -> b) -> a -> c 	-- Defined in ‘GHC.Base’
-- infixr 9 .

-- partially applying into composition woah 
-- >>> take 5 . reverse $ [1..10]
-- [10,9,8,7,6]

-- what the fuck this is pretty nice 
-- >>> take 5 . filter odd . enumFrom $ 3
-- [3,5,7,9,11]
-- >>> :t (filter odd . enumFrom $ 3)
-- (filter odd . enumFrom $ 3) :: Integral a => [a]

-- pointfree 
f :: (Num c, Foldable t) => t c -> c
f = negate . sum 
-- >>> f [1..5]
-- -15


