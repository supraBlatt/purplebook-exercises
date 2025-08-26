
-- this is like set notation
squares =  [ x^2 | x <- [1..10] ]
-- >>> squares
-- [1,4,9,16,25,36,49,64,81,100]

squaresEven =  [ x^2 | x <- [1..10], even x]
-- >>> squaresEven
-- [4,16,36,64,100]

-- order with multiple 'generators' seems to be enforced?
multipleGens = [x^y | x <- [1..5], y <- [2,3]]
-- >>> multipleGens
-- [1,1,4,8,9,27,16,64,25,125]

multipleGensRestr = [x^y | x <- [1..10], y <- [2, 3], x^y < 200]
-- >>> multipleGensRestr
-- [1,1,4,8,9,27,16,64,25,125,36,49,64,81,100]

cartesian = [(x, y) | x <- [1, 2, 3], y <- [6, 7]]
-- >>> cartesian
-- [(1,6),(1,7),(2,6),(2,7),(3,6),(3,7)]

-- they choose a single linearization of the 'set', which is fine

nestedGen = [(x, y) | x <- squares, x < 6, y <- [1..3]]
-- >>> nestedGen
-- [(1,1),(1,2),(1,3),(4,1),(4,2),(4,3)]

mySqr :: [Integer]
mySqr = [x^2 | x <- [1..5]]
-- >>> [x | x <- mySqr, rem x 2 == 0]
-- [4,16]

-- >>> [(x, y) | x <- mySqr, y <- mySqr, x < 50, y > 50]
-- []

-- >>> take 5 [ (x, y) | x <- mySqr, y <- mySqr, x < 50, y > 50 ]
-- []
