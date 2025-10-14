import Text.XHtml (base)

data BinaryTree a
  = Leaf
  | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Ord, Show)

-- we are concerned with search trees as it seems, so we want Ord
-- if exists, don't reinsert it. kinda meme ig
insert' b Leaf = Node Leaf b Leaf
insert' b (Node left a right)
  | b == a = Node left a right
  | b < a = Node (insert' b left) a right
  | b > a = Node left a (insert' b right)

-- trees are traversable and foldable
-- naive mapping does not retain order, or duplicate prevention

mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree _ Leaf = Leaf
mapTree f (Node left a right) =
  Node (mapTree f left) (f a) (mapTree f right)

testTree' =
  Node (Node Leaf 3 Leaf) 1 (Node Leaf 4 Leaf)

mapExpected =
  Node (Node Leaf 4 Leaf) 2 (Node Leaf 5 Leaf)

-- >>> mapTree (+1) testTree' == mapExpected
-- True

-- i couldn't be assed to make it 'efficient'
preorder :: BinaryTree a -> [a]
preorder Leaf = []
preorder (Node l a r) = [a] ++ preorder l ++ preorder r

inorder :: BinaryTree a -> [a]
inorder Leaf = []
inorder (Node l a r) = inorder l ++ [a] ++ inorder r

postorder :: BinaryTree a -> [a]
postorder Leaf = []
postorder (Node l a r) = postorder l ++ postorder r ++ [a]

testTree :: BinaryTree Integer
testTree = Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf)

-- >>> preorder testTree == [2, 1, 3]
-- >>> inorder testTree == [1, 2, 3]
-- >>> postorder testTree == [1, 3, 2]
-- True
-- True
-- True

foldTree :: (a -> b -> b) -> b -> BinaryTree a -> b
foldTree f b t = foldr f b (preorder t)
