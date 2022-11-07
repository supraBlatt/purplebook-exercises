myAbs :: Integer -> Integer 
myAbs x 
    | x < 0     = -x  
    | otherwise = x 
-- >>> myAbs (-10)
-- 10

bloodNa :: Integer -> String 
bloodNa x 
      | x < 135 = "low"
      | x > 145 = "high"
      | otherwise = "mwah"
-- >>> bloodNa 138
-- "mwah"

isRight :: (Num a, Eq a) => a -> a -> a -> String
isRight a b c 
      | a^2 + b^2 == c^2     = "YEPPERS"
      | otherwise            = "nop .-."
-- >>> isRight 3 4 5
-- "YEPPERS"

-- using where with guards 
avgGrade :: (Ord a, Fractional a) => a -> Char
avgGrade x 
       | y >= 0.9 = 'A'
       | y >= 0.8 = 'B'
       | y >= 0.7 = 'C' 
       | y >= 0.6 = 'D' 
       | otherwise = 'F' 
       where y = x / 100 

pal :: Eq a => [a] -> Bool
pal xs 
  | xs == reverse xs     = True 
  | otherwise            = False 

-- >>> :i reverse
-- reverse :: [a] -> [a] 	-- Defined in ‘GHC.List’

nums :: (Ord a1, Num a1, Num a2) => a1 -> a2
nums x 
   | x < 0   = -1 
   | x == 0  = 0
   | x > 0   = 1

-- im so confused all of a sudden by typeclasses lmao
-- and type defaulting. time to go back and read.. 