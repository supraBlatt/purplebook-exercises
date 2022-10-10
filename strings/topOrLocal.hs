-- shiiit nice type inference haskell bb
topLevelFunction x = x + woot + topLevelValue
                     where woot = 10

topLevelValue = 5

-- test for scoping
area d  = pi * (r d ^ 2)
r d = d / 2
-- >>> area 2
-- 3.141592653589793

-- alternate approach, better.. 
area2 d = pi * r ^ 2
          where r = d / 2
-- >>> area2 2
-- 3.141592653589793

-- >>> :t (++)
-- (++) :: [a] -> [a] -> [a]

-- >>> :t concat
-- concat :: Foldable t => t [a] -> [a]
