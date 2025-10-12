
-- foldr can stop its evaluation midway through the spine
-- >>> foldr const 0 ([1..5] ++ undefined)
-- 1

-- but foldl is cooked. it does not have to evaluate the values though
-- >>> foldl const 0 ([1..5] ++ undefined)
-- Prelude.undefined

-- >>> foldl const 0 ([undefined])
-- 0

