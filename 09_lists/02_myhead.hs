myHead (x : _) = x

myTail (_ : xs) = xs

-- >>> myHead []
-- Non-exhaustive patterns in function myHead

safeHead [] = Nothing
safeHead (x : _ ) = Just x

-- >>> safeHead []
-- Nothing

safeTail [] = Nothing
safeTail [x] = Nothing
safeTail (_ : xs) = Just xs

