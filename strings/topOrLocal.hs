-- shiiit nice type inference haskell bb
topLevelFunction x = x + woot + topLevelValue
                     where woot = 10

topLevelValue = 5

-- test for scoping
area d  = pi * (r d ^ 2)
r d = d / 2
-- >>> area 2
-- 3.141592653589793

-- alternate approach, better.. 
area2 d = pi * r ^ 2
          where r = d / 2
-- >>> area2 2
-- 3.141592653589793

-- >>> :t (++)
-- (++) :: [a] -> [a] -> [a]

-- >>> :t concat
-- concat :: Foldable t => t [a] -> [a]

-- >>> :i Foldable
-- type Foldable :: (* -> *) -> Constraint
-- class Foldable t where
--   fold :: Monoid m => t m -> m
--   foldMap :: Monoid m => (a -> m) -> t a -> m
--   foldMap' :: Monoid m => (a -> m) -> t a -> m
--   foldr :: (a -> b -> b) -> b -> t a -> b
--   foldr' :: (a -> b -> b) -> b -> t a -> b
--   foldl :: (b -> a -> b) -> b -> t a -> b
--   foldl' :: (b -> a -> b) -> b -> t a -> b
--   foldr1 :: (a -> a -> a) -> t a -> a
--   foldl1 :: (a -> a -> a) -> t a -> a
--   toList :: t a -> [a]
--   null :: t a -> Bool
--   length :: t a -> Int
--   elem :: Eq a => a -> t a -> Bool
--   maximum :: Ord a => t a -> a
--   minimum :: Ord a => t a -> a
--   sum :: Num a => t a -> a
--   product :: Num a => t a -> a
