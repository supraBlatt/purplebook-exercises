import Data.List (sort)

-- Match the Types -- 
-- 1 
i :: Num a => a 
i = 1 

-- 2 + 3  
f :: Fractional a => a 
f = 1.0 

-- 4
g :: Float 
g = 1.0 

-- 5 
freud :: Ord a => a -> a 
freud x = x 

-- 6
freud' :: Int -> Int  
freud' x = x 

-- 7 + 8
myX = 1 :: Int 
sigmund :: Num a => a -> Int 
sigmund x = myX 

-- 9 + 10 
jung :: [Int] -> Int
-- jung :: Ord a => [a] -> a 
jung xs = head (sort xs) 

-- 11 
mySort :: [Char] -> [Char] 
mySort = sort 

-- signifier :: Ord a => [a] -> a
signifier :: [Char] -> Char 
signifier xs = head (mySort xs)
