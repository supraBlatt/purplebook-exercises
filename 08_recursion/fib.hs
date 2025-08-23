-- 1 1 2 3 5 8 13 ... 

-- tree version
fib1 :: (Integral a) => a -> a
fib1 n = case n of
     0 -> 1
     1 -> 1
     _ -> fib1 (n-1) + fib1 (n-2)
-- >>> fib1 10
-- 89
fib2 n cur last = case n of
              0 -> cur
              _ -> fib2 (n-1) (cur+last) cur
-- >>> fib2 4 1 0 
-- 5


buz n   | n `mod` 15 == 0 = "fizzbuzz"
        | n `mod` 5 == 0  = "fizz"
        | n `mod` 3 == 0  = "buzz"
        | otherwise       = show n 


fizzbuzz :: Int -> IO ()
fizzbuzz n = mapM_ putStrLn $ map buz [1..n]


-- >>> fizzbuzz 5

-- >>> :t map
-- map :: (a -> b) -> [a] -> [b]
