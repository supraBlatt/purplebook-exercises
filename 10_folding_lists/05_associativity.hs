
nums = [1..3]
z = 2

-- >>> scanr (^) z nums
-- [1,512,9,2]

-- >>> scanl (^) z nums
-- [2,2,4,64]

-- >>> foldr (:) [] nums 
-- [1,2,3]

-- >>> foldl (:) [] nums
-- Couldn't match type `Integer' with `[[a_aGlR[sk:1]]]'
-- Expected: [[[a_aGlR[sk:1]]]] ...

-- >>> foldl (flip (:)) [] nums
-- [3,2,1]

-- then we can do what we did before with const. it does not evaluate its second argument at all.
-- >>> foldr const 0 [1..5]
-- 1

-- >>> foldr (flip const) 0 [1..5]
-- 0

-- >>> foldl const 0 [1..5]
-- 0

-- >>> foldl (flip const) 0 [1..5]
-- 5

