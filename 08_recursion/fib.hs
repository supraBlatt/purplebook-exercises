-- 1 1 2 3 5 8 13 ... 

-- tree version
fib1 :: (Integral a) => a -> a
fib1 n = case n of
     0 -> 1
     1 -> 1
     _ -> fib1 (n-1) + fib1 (n-2)
-- >>> fib1 4
-- 5

-- recrusive iterative? 
fib2 :: (Integral a) => a -> a -> a ->  a
fib2 n cur last = case n of
              0 -> cur
              _ -> fib2 (n-1) (cur+last) cur
-- >>> fib2 4 1 0 
-- 5
