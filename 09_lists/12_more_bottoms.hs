-- >>> take 1 $ map (+1) [undefined, 2, 3]
-- Prelude.undefined

-- >>> take 1 $ map (+1) [1, undefined, 3]
-- [2]

-- >>> take 2 $ map (+1) [1, undefined, 3]
-- Prelude.undefined

-- >>> :t \xs -> map (\x -> elem x "aeiou") xs
-- \xs -> map (\x -> elem x "aeiou") xs :: [Char] -> [Bool]

-- >>> map (^2) [1..10]
-- [1,4,9,16,25,36,49,64,81,100]

-- >>> map minimum [[1..10], [10..20], [20..30]]
-- [1,10,20]

-- >>> map sum [[1..5], [1..5], [1..5]]
-- [15,15,15]

-- >>> :t Data.Bool.bool
-- Data.Bool.bool :: a -> a -> Bool -> a

-- >>> map (\x -> if x == 3 then (-x) else (x)) [1..10]
-- [1,2,-3,4,5,6,7,8,9,10]

-- >>> map (\x -> Data.Bool.bool x (-x) (x==3)) [1..10]
-- [1,2,-3,4,5,6,7,8,9,10]

-- >>> :t Data.Bool.bool
-- Data.Bool.bool :: a -> a -> Bool -> a

-- >>> :t negate
-- negate :: Num a => a -> a

-- >>> :t Data.Bool.bool negate id 
-- Data.Bool.bool negate id :: Num a => Bool -> a -> a
