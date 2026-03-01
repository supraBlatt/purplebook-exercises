data Two a b = Two a b deriving (Eq, Show)
data Or a b = First a | Second b deriving (Eq, Show)

functorId :: (Eq (f b), Functor f) => f b -> Bool
functorId f = fmap id f == f

functorCompose :: (Eq (f b1), Functor f) => 
  (a -> b2) -> (b2 -> b1) -> f a -> Bool
functorCompose f g x = 
  (fmap g (fmap f x)) == (fmap (g . f) x)
