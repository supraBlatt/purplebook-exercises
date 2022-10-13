-- 1 
f :: a -> a -> a -> a 
f = undefined -- unsafe?
x :: Char 
x = undefined 
-- >>> :t f x
-- f x :: Char -> Char -> Char

-- 2
g :: a -> b -> c -> b 
g = undefined
-- >>> :t g 0 'c' "woot"
-- g 0 'c' "woot" :: Char

-- 3
h :: (Num a, Num b) => a -> b -> b 
h = undefined 
-- >>> :t h 1.0 2
-- h 1.0 2 :: Num b => b
-- woah 


-- 4
-- >>> :t h 1 (5.5 :: Double)
-- h 1 (5.5 :: Double) :: Double
-- ok i kinda guessed that one right

-- 5
jackal :: (Ord a, Eq b) => a -> b -> a 
jackal = undefined 
-- >>> :t jackal "keyboard" "ay"
-- jackal "keyboard" "ay" :: [Char]

-- 6
-- >>> :t jackal "keyboard"
-- jackal "keyboard" :: Eq b => b -> [Char]

-- 7 
kessel :: (Ord a, Num b) => a -> b -> a 
kessel = undefined 
-- >>> :t kessel 1
-- kessel 1 :: (Ord a, Num b, Num a) => b -> a

-- 8 
-- >>> :t kessel 1 (2 :: Integer)
-- kessel 1 (2 :: Integer) :: (Ord a, Num a) => a

-- 9 
-- >>> :t kessel (1 :: Integer) 2
-- kessel (1 :: Integer) 2 :: Integer

-- wow this is somewhat confusing
