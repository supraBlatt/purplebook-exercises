-- rewriting own version of zip
myZip _ [] = []
myZip [] _ = []
myZip (x:xs) (y:ys) = (x,y) : myZip xs ys

-- >>> myZip [1,2,3] [4,5]
-- [(1,4),(2,5)]

-- rewriting own version of zipWith
myZipWith _ _ [] = []
myZipWith _ [] _ = []
myZipWith f (x:xs) (y:ys) = f x y : myZipWith f xs ys

-- >>> myZipWith (==) ['a'..'f'] ['a'..'m']
-- [True,True,True,True,True,True]

-- >>> myZipWith max [10,5,34,9] [6, 8, 12, 7]
-- [10,8,34,9]


-- re-rewriting zip using zipWith
myZip' = myZipWith (,)

-- >>> myZip' [1,2,3] [4,5]
-- [(1,4),(2,5)]

