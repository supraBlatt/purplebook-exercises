-- a -> a                  a :: *
-- a -> b a -> T (b a)     b. T :: * -> *   
-- c a b -> c b a          c :: * -> * -> * 

-- >>> :t ($)
-- >>> :t (<$>)
-- ($) ::                (a -> b) ->   a ->   b
-- (<$>) :: Functor f => (a -> b) -> f a -> f b

-- FUNCTOR LAWS:
-- (1) fmap id = id
-- (2) fmap (f . g) = fmap f . fmap g