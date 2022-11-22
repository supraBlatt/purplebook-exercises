f :: Bool -> Int 
f False = 0 
-- >>> f True
-- Non-exhaustive patterns in function f

-- >>> :i Maybe
-- type Maybe :: * -> *
-- data Maybe a = Nothing | Just a

f' :: Bool -> Maybe Int 
f' False  = Just 0 
f'  _     = Nothing
-- >>> f' False
-- Just 0
