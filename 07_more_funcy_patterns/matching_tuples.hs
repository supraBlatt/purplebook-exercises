addEmUp :: Num a => (a, a) -> a
addEmUp (x, y) = x + y

addEmUp' :: Num a => (a, a) -> a
addEmUp' = uncurry (+)
-- >>> :i uncurry
-- uncurry :: (a -> b -> c) -> (a, b) -> c 	-- Defined in ‘Data.Tuple’

fst3 :: (a, b, c) -> a
fst3 (x, _, _) = x

third3 :: (a, b, c) -> c
third3 (_, _, x) = x
