curry1 f a b = f (a, b)
curry2 f a b = f a b -- or just curry2 f = f?

-- >>> :t curry1
-- >>> :t curry2
-- curry1 :: ((a, b) -> t) -> a -> b -> t
-- curry2 :: (t1 -> t2 -> p) -> t1 -> t2 -> p

-- curry1 could be used to use an uncurried fnc
-- like fst (a, b) in a curried syntax
-- curry1 fst a b (?)

uncurry1 f (a, p) = f a p
-- >>> :t uncurry1 
-- uncurry1 :: (t1 -> t2 -> t3) -> (t1, t2) -> t3

-- similarly allows us to use (+) 1 2 as 
-- uncurry (+) (1 , 2)
