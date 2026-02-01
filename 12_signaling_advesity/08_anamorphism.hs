import Data.List (unfoldr)
import Data.Maybe (fromMaybe)

-- >>> :t iterate
-- iterate :: (a -> a) -> a -> [a]

-- >>> :t unfoldr
-- unfoldr :: (b -> Maybe (a, b)) -> b -> [a]

a = take 10 $ unfoldr (\b -> Just (b, b + 1)) 0

-- >>> a
-- [0,1,2,3,4,5,6,7,8,9]

myIterate :: (a -> a) -> a -> [a]
myIterate f a = a : myIterate f (f a)

-- >>> take 10 $ myIterate (+1) 0
-- [0,1,2,3,4,5,6,7,8,9]

myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
myUnfoldr f b = maybe [] (\(a', b') -> a' : myUnfoldr f b') (f b)

-- >>> take 10 $ myUnfoldr (\b -> Just (b, b + 1)) 0
-- [0,1,2,3,4,5,6,7,8,9]

betterIterate :: (a -> a) -> a -> [a]
betterIterate f = myUnfoldr (\a -> Just (a, f a))

-- >>> take 12 $ betterIterate (+1) 0
-- [0,1,2,3,4,5,6,7,8,9,10,11]

data BinaryTree a
  = Leaf
  | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Ord, Show)

unfold :: (a -> Maybe (a, b, a)) -> a -> BinaryTree b
unfold f a = case f a of
  Nothing -> Leaf
  Just (l, b, r) -> Node (unfold f l) b (unfold f r)

treeBuild :: Integer -> BinaryTree Integer
-- treeBuild n = unfold (\d -> if d > n then Nothing else Just (d+1, d, d+1)) 0
treeBuild n = unfold go 0
  where
    go depth
      | depth > n = Nothing
      | otherwise = Just (depth + 1, depth, depth + 1)

-- >>> treeBuild 2
-- Node (Node (Node Leaf 2 Leaf) 1 (Node Leaf 2 Leaf)) 0 (Node (Node Leaf 2 Leaf) 1 (Node Leaf 2 Leaf))
