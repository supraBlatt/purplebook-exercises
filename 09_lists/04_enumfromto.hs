-- eftBool :: Bool -> Bool -> [Bool]
-- eftBool b1 b2 = case (b1, b2) of
--                     (b, b) -> [b]
--                     (True, False) -> [True, False]
--                     _ -> []

-- I am actually goated for coming up with this ngl
-- Although, this does feel like cheating to use Int's Enum functions.
eftBool :: Bool -> Bool -> [Bool]
eftBool x y = map toEnum [fromEnum x .. fromEnum y]

-- >>> eftBool True True
-- [True]

-- Desugared the range syntax
eftBool' :: Bool -> Bool -> [Bool]
eftBool' x y = map toEnum (enumFromTo (fromEnum x) (fromEnum y))

-- >>> eftBool' False True
-- [False,True]

-- This basically works for all Enum variants that implement succ..
eftInt :: Int -> Int -> [Int]
eftInt x y
    | x <= y    = x : eftInt (succ x) y
    | otherwise = []

-- >>> eftInt 8 7
-- []