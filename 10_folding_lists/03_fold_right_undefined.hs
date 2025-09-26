{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use sum" #-}
u = undefined

-- >>> u
-- Prelude.undefined

z1 = foldr (+) 0 [1,2,3,4,u]
-- >>> z1
-- Prelude.undefined

z2 = foldr (+) 0 (take 4 [1,2,3,4, u])
-- >>> z2
-- 10

z3 = foldr (+) 0 (take 4 ([1,2,3,4] ++ u))
-- >>> z3
-- 10

-- >>> take 4 ([1,2] ++ undefined)
-- Prelude.undefined

-- >>> take 2 $ take 4 ([1,2] ++ undefined)
-- [1,2]

foldConst :: [a] -> Integer
foldConst = foldr (\_ _ -> 9001) 0
-- >>> foldConst [1..5]
-- 9001

-- >>> foldConst [1,2,3, undefined]
-- 9001

-- >>> foldConst ([1,2,3] ++ undefined)
-- 9001

-- >>> foldConst [undefined]
-- 9001

-- >>> foldConst undefined
-- Prelude.undefined

-- "(1+(2+(3+(4+(5+0)))))"
-- a + b -> 9001

-- but actually it doesnt even evaluate anything 
-- besides the first list cons cell
-- for pattern matching strictness reasons
