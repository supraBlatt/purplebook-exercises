-- a = [1,2,3,4,5] -- nf
-- b = 1 : 2 : 3 : 4 : _ -- whnf
-- c = enumFromTo 1 10 -- neither
-- d = length [1,2,3,4,5] -- neither
-- e = sum (enumFromTo 1 10) -- neither?
-- f = ['a'..'m'] ++ ['n'..'z'] -- neither?
-- g = (_, 'b') -- whnf

-- lmao this is weird to have so many neithers.

-- I dont understand the way evaluation ties to WHNF
-- map (+1) (1 : (2 : (3 : [])))
-- becomes 
-- (+1) 1 : map (+1) (2 : (3 : []))
-- which is WHNF? 
-- and now when do we evaluate (+1) 1? 
-- how do we choose to do it?
