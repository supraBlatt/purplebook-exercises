-- 2
recSum 0 = 0
recSum n = n + recSum (n - 1)

recSum' n = sum [1 .. n]

recSum'' 0 cur = cur
recSum'' n cur = recSum'' (n - 1) (cur + n)

-- >>> recSum'' 1

recSum''' n = go n 0
  where
    go n cur
      | n == 0 = cur
      | otherwise = go (n - 1) (cur + n)

-- >>> recSum''' 54
-- 1485

-- 3
multInt :: (Integral a) => a -> a -> a
multInt a 0 = 0
multInt a b = a + multInt a (b - 1)

multInt' a b = go a b 0
  where
    go a b cur
      | b == 0 = cur
      | otherwise = go a (b - 1) (cur + a)

-- until i find a better way to write this..
multIntWrap :: (Integral a) => a -> a -> a
multIntWrap a b
  | a > b = multInt' a b
  | otherwise = multInt' b a

-- >>> multInt 0 100000
-- 100000

-- >>> multInt' 4 10
-- 40

mcCarthy x 
    | x > 100 = x - 10 
    | otherwise = mcCarthy . mcCarthy $ x + 11 