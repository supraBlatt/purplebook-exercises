awesome = ["papuchon", "curry", ":)"]
alsoAwesome = ["Quake", "The Simons"]
allAwesome = [awesome, alsoAwesome]

-- >>> length (concat allAwesome)
-- 5
-- >>> 6 / length [1, 2, 3]
-- No instance for (Fractional Int) arising from a use of ‘/’

-- to fix this type mismatch we can use either `div` or `fromIntegral`
-- >>> div 6 $ length [1, 2, 3]
-- >>> 6 / (fromIntegral $ length [1, 2, 3])
-- 2
-- 2.0

isPalindrome :: Eq a => [a] -> Bool
isPalindrome x = reverse x == x -- doesn't work with infinite lists 
-- >>> isPalindrome "palilap"
-- True

myAbs :: Integer -> Integer 
myAbs x = if x < 0 then negate x else x  
-- >>> myAbs (-1)
-- 1

-- tuples be kinda confusing.. 
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y) , (fst x, fst y))
-- >>> f (1, 2) (3, 4)
-- ((2,4),(1,3))