import Data.List (elemIndex)

l:: [(Integer, Integer)]
l = zip [1..3] [4..6]

-- 1
added :: Maybe Integer
added = (+3) <$> lookup 3 l

-- 2
y2 :: Maybe Integer
y2 = lookup 3 $ l

z2 :: Maybe Integer
z2 = lookup 2 $ l

tupled :: Maybe (Integer, Integer)
tupled = (,) <$> y2 <*> z2

-- 3

x3 :: Maybe Int
x3 = elemIndex 3 [1..5]

y3 :: Maybe Int
y3 = elemIndex 4 [1..5]

max' :: Int -> Int -> Int
max' = max

maxed :: Maybe Int
maxed = max' <$> x3 <*> y3

-- 4
summed :: Maybe Integer
summed = sum <$> liftA2 (,) y2 z2
