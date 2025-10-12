-- == 1 ==
-- (*) is associative. so (*) and (flip *) behave the same, and so do foldl and foldr
-- >>> foldr (*) 1 [1..5]
-- >>> foldl (flip (*)) 1 [1..5]
-- >>> foldl (*) 1 [1..5]
-- 120
-- 120
-- 120

-- == 2 ==
-- f = flip (*)
-- foldl f 1 [1..3]
-- (((1 'f' 1) 'f' 2) 'f' 3)
-- ((1 'f' 2) 'f' 3)
-- (2 'f' 3)
-- 6

-- >>> foldl (flip (*)) 1 [1..3]
-- 6

-- == 3 ==
-- c, "foldr, but not foldl, associates to the right"

-- == 4 == 
-- a, "reduce structure"

-- == 5 ==

a =  foldr (++) "" ["woot", "WOOT", "woot"]
-- >>> a
-- "wootWOOTwoot"

-- idk if this works?
b = foldr max (toEnum 0) "fear is the little death"
-- >>> b
-- 't'

-- >>> :t and
-- and :: Foldable t => t Bool -> Bool
c = foldr (&&) True [False, True]

-- >>> c
-- False

-- i dont think i understand the question, but a single True dominates the return value, unless there is an undefined before it
d = foldr (||) True [False, undefined, True]
-- >>> d
-- Prelude.undefined

-- False || (True || (undefined || True))

e = foldr ((++) . show) "" [1..5 :: Int]
e' = foldl (flip (flip (++). show)) "" [1..5::Int]
-- >>> e
-- >>> e'
-- "12345"
-- "12345"

f = foldl const 'a' [1..5]
-- >>> f
-- 'a'

g = foldl const 0 "tacos"
-- >>> g
-- 0

h = foldr (flip const) 0 "burritos"
-- >>> h
-- 0

i = foldl const 'z' [1..5]
-- >>> i
-- 'z'
