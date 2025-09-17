-- exercise

-- >>> [x^y | x <- [1..5], y <- [2, undefined]]
-- Prelude.undefined

-- >>> take 1 $ [x^y | x <- [1..5], y <- [2, undefined]]
-- [1]

-- >>> sum [1, undefined, 3]
-- Prelude.undefined

-- >>> length [1, 2, undefined]
-- 3

-- >>> length $ [1,2,3] ++ undefined
-- Prelude.undefined

-- i was mistaken here ah
-- >>> take 1 $ filter even [1,2,3, undefined]
-- [2]

-- >>> take 1 $ filter even [1, 3, undefined]
-- Prelude.undefined

-- >>> take 1 $ filter odd [1,3, undefined]
-- [1]

-- >>> take 2 $ filter odd [1,3, undefined]
-- [1,3]

-- >>> take 3 $ filter odd [1,3, undefined]
-- Prelude.undefined
