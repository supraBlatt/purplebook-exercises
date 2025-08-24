myHead (x : _) = x

myTail (_ : xs) = xs

-- >>> myHead []
-- /home/yu/Projects/Learning/purplebook-exercises/09_Lists/02_myhead.hs:1:1-17: Non-exhaustive patterns in function myHead

safeHead [] = Nothing
safeHead (x : _ ) = Just x

-- >>> safeHead []
-- Nothing

safeTail [] = Nothing
safeTail [x] = Nothing
safeTail (_ : xs) = Just xs

