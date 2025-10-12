import Data.ByteString (intercalate)
stops = "pbtdkg"
-- >>> length stops
-- 6
vowels = "aeiou"
-- >>> length vowels
-- 5


-- >>> :t (++)
-- (++) :: [a] -> [a] -> [a]

combos = [[s1, v, s2] | s1 <- stops, v <- vowels, s2 <- stops]
-- >>> length combos 
-- 180

combosP = [['p', v, s2] | v <- vowels, s2 <- stops]
-- >>> length combosP
-- 30

nouns = ["arc", "dick"]
verbs = ["sucks"]

combosN = [unwords [n1, v, n2] | n1 <- nouns, v <- verbs, n2 <- nouns]
-- >>> combosN
-- ["arc sucks arc","arc sucks dick","dick sucks arc","dick sucks dick"]

-- this is an average word length function
seekritFunc :: String -> Int
seekritFunc x =
 div (sum (map length (words x)))
 (length (words x))

seekritFunc' :: String -> Double
seekritFunc' x = fromIntegral s / fromIntegral c
       where s = sum (map length (words x))
             c = length (words x)