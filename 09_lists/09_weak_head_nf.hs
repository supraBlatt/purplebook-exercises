-- WHNF evaluates UNTIL the first data constructor
-- or a lambda awaiting an arg


-- (1,2) in NF
-- (1+1, 2) in WHNF 

-- Prelude> let myNum :: [Int]; myNum = [1..10]
-- Prelude> :sprint myNum
-- myNum = _
-- Prelude> take 2 myNum
-- [1,2]
-- Prelude> :sprint myNum
-- myNum = 1 : 2 : _

-- This evaluates only the spine, but the spine here is cooked
-- >>> [1] ++ undefined ++ [3]
-- Prelude.undefined

-- >>> length ([1] ++ undefined ++ [3])
-- Prelude.undefined
