myOr :: [Bool] -> Bool
myOr = foldr (||) False

myAny :: (a -> Bool) -> [a] -> Bool
myAny p = foldr ((||) . p) False
-- >>> myAny odd [1,3,5]
-- True

myElem :: Eq a => a -> [a] -> Bool
myElem v = myAny (==v)
-- >>> myElem 1 [2..10]
-- False

myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []
-- >>> myReverse [1..5]
-- [5,4,3,2,1]

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:) . f) []
-- >>> myMap (+2) [1..3]
-- [3,4,5]

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p = foldr (\a b -> if p a then a : b else b) []
-- >>> myFilter odd [1..5]
-- [1,3,5]

myFlatten :: [[a]] -> [a]
myFlatten = foldr (++) []
-- >>> myFlatten [[1..3], [11..13], [21..23]]
-- [1,2,3,11,12,13,21,22,23]

myFlatMap :: (a -> [b]) -> [a] -> [b]
myFlatMap f = myFlatten . myMap f
-- >>> myFlatMap (\x-> [1, x, 3]) [2,4]
-- [1,2,3,1,4,3]

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy p = foldr1 (\a b -> case p a b of
                                GT -> a
                                _  -> b)
-- >>> myMaximumBy compare [1..10]
-- 10

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy p = foldr1 (\a b -> case p a b of
                                GT -> b
                                _  -> a)
-- >>> myMinimumBy compare [1..10]
-- 1

