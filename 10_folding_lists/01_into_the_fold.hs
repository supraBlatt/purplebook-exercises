-- >>> :t foldr
-- foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b

-- >>> :t foldl
-- foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b

-- >>> :t foldl'
-- Variable not in scope: foldl'

-- foldr f b [a0..an] 
-- f an (.. (f a1 (f a0 b)))

-- f a0 (..(f an-1 (f an b))

-- f ..(f (f b a0) a1) .. a0

-- why is recursion here always right associative?
-- no, foldl is left associatve.