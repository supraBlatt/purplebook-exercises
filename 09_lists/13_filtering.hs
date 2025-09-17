threes = filter (\x -> x `mod` 3 == 0)
-- >>> threes [1..30]
-- [3,6,9,12,15,18,21,24,27,30]

-- >>> :t mod
-- mod :: Integral a => a -> a -> a

-- >>> :t rem
-- rem :: Integral a => a -> a -> a

amountThrees = length . threes
-- >>> amountThrees [1..30]
-- 10

-- >>> :t words
-- words :: String -> [String]

isFiller = (`elem` ["the", "a", "an"])

-- >>> isFiller "the"
-- True

myFilter :: String -> [String]
myFilter = filter (not . isFiller) . words

-- >>> myFilter "the brown dog was a goof"
-- ["brown","dog","was","goof"]
