import Language.Haskell.TH (tupleTypeName)
-- >>> :t elem
-- elem :: (Foldable t, Eq a) => a -> t a -> Bool

-- >>> elem 'a' "Juliea"
-- True

uppercase s = [x | x <- s, x `elem` ['A'..'Z']]
-- >>> uppercase "Three Letter Acronym A"
-- "TLAA"

mySqr = [x^2 | x <- [1..5]]
myCube = [y^3 | y <- [1..5]]
-- >>> mySqr
-- >>> myCube
-- [1,4,9,16,25]
-- [1,8,27,64,125]

tups = [(x, y) |  x <- mySqr, y <- myCube]
-- >>> tups
-- [(1,1),(1,8),(1,27),(1,64),(1,125),(4,1),(4,8),(4,27),(4,64),(4,125),(9,1),(9,8),(9,27),(9,64),(9,125),(16,1),(16,8),(16,27),(16,64),(16,125),(25,1),(25,8),(25,27),(25,64),(25,125)]
-- >>> length tups
-- 25

tups50 = [(x, y) |  x <- mySqr, x<50, y <- myCube, y<50]
-- >>> tups50
-- [(1,1),(1,8),(1,27),(4,1),(4,8),(4,27),(9,1),(9,8),(9,27),(16,1),(16,8),(16,27),(25,1),(25,8),(25,27)]

-- >>> length tups50
-- 15

