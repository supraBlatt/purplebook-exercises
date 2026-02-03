import Data.Monoid (Sum (..))

-- monoid S (*) =
-- 1. exists unit e for S, (*):  e * s = s * e = s
-- 2. assoc (*)

class Monoid' m where
  mempty'  :: m
  mappend' :: m -> m -> m
  mconcat' :: [m] -> m
  mconcat' = foldr mappend' mempty'
 
-- >>> mappend [1,2,3] [4,5,6]
-- [1,2,3,4,5,6]

-- >>> mappend "Trout" " goes well with garlic"
-- "Trout goes well with garlic"

-- womp womp only a single (*) per type!! 
-- as per making an instance of Monoid and choosing one (!!) mappend

-- instead, we use newtypes. each newtype takes the job of an instance for 
-- a specific (*) lmao

-- >>> mappend (Sum 1) (Sum 5)
-- Sum {getSum = 6}
