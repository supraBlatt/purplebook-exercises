-- >>> :t foldl
-- foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b

-- >>> :t foldl1
-- foldl1 :: Foldable t => (a -> a -> a) -> t a -> a

foldl' f acc [] = acc
foldl' f acc (x:xs) = foldl f (f acc x) xs

xs = map show [1..5]
zl = foldl (\x y -> concat ["(", x, "+", y, ")"]) "0" xs

-- >>> zl
-- "(((((0+1)+2)+3)+4)+5)"


-- instead of a zero element, we return the accumulator.

-- >>> scanl (+) 0 [1..5]
-- [15,14,12,9,5,0]

-- folds behave strangely when the operator is not associative
-- usually, we want a [[Monoid]] for this very reason

-- >>> foldr (^) 2 [1..3]
-- 1

-- >>> foldl (^) 2 [1..3]
-- 64

-- >>> scanl (flip (:)) [] [1..3]
-- [[],[1],[2,1],[3,2,1]]