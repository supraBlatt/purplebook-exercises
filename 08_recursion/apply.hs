incTime :: (Eq a, Num a) => a -> a -> a
incTime 0 n = n
incTime t n = 1 + incTime (t-1) n

-- >>> incTime 2 4t
-- 6
-- incTimes t n = case t of 
--          0 ->  n 
--          _ ->  1 + incTimes (t-1) n  

-- how does this.. open up? 
-- does it depend on evaluation style? 
-- how does the partial application of incTimes.. unfold?
-- OH THUNKS!!!!! RIGHT!!! 
incTimes :: (Eq a, Num a) => a -> a -> a
incTimes 0 n = n
incTimes t n = (+1) . incTimes (t-1) $ n


-- maybe a better way to formulate this? 
incTimes' :: (Eq a, Num a) => a -> a -> a
incTimes' 0 n = n 
incTimes' t n = (+1) $ incTimes (t-1) n
-- >>> incTimes' 4 1
-- 5

-- >>> 1 + 1
-- 2
