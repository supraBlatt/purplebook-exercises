-- linearly recursive factorial
factorial :: Integer -> Integer
factorial 0 = 1 
factorial n = n * factorial (n-1)
-- >>> factorial 4
-- 24

-- linearly iterative factorial
factorialIt :: Integer -> Integer -> Integer
factorialIt mul 0 = mul
factorialIt mul n = factorialIt (mul*n) (n-1)
-- >>> factorialIt 1 10
-- 3628800

-- take 5 . filter odd . enumFrom $ 3
-- [  |  <- | <- applying <- |   <- ]   