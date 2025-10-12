a = foldr (\ a b-> take 3 a ++ b) ""
    ["Pizza", "Apple", "Banana"]

-- >>> a
-- "PizAppBan"

b = foldl (\ a b-> a ++ take 3 b) ""
    ["Pizza", "Apple", "Banana"]

-- >>> b
-- "PizAppBan"

-- note that both examples are essentially concat $ map (take 3)
-- it's a 'division' of the application of (take 3) and of the fold

-- >>> concat$  map (take 3) ["Pizza", "Apple", "Banana"]
-- "PizAppBan"



