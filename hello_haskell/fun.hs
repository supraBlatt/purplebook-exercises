waxOn = x * 5
        where x = y ^ 2 
              y = z + 8
              z = 7 

triple x = x + 3

-- hmm why does it get evaluated 
-- as       (triple x) / 2 
-- and not   triple (x / 2)
-- is it precedence? left associativity? 
-- apparently application has a high precedence.

waxOff x = triple x / 2 
-- >>> waxOff 2
-- 2.5

-- LENS ARE NICE HOLY SHIT 
-- >>> :t ()
-- () :: ()
-- prop> \(xs :: [Int]) -> length (reverse xs) == length xs
-- +++ OK, passed 100 tests.

