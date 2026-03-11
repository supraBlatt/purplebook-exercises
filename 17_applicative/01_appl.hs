{-# LANGUAGE FlexibleInstances #-}

-- pure :: a -> f a 
-- appl :: f (a -> b) -> f a -> f b

-- you can impl fmap with these 2 as
-- fmap f fa = pure f <*> fa

-- so, if i can generate a functor instance for an appl
-- 1. why do i need F to be a functor? 
-- 2. can F's fmap and this derived fmap be different?

-- >>> ("woo", (+1)) <*> ("hoo", 2)
-- ("woohoo",3)

-- F : C -> C'
-- F(a) *C' F(b) = F (a *C b)
