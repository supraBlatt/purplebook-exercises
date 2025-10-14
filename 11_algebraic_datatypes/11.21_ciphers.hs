import Data.Char

-- >>> :t cycle
-- cycle :: HasCallStack => [a] -> [a]

vigenere :: [Char] -> [Char] -> [Char]
vigenere ks = zipWith shift ss
  where
    ss = map norm (cycle ks)
    norm c
      | isLower c = ord c - ord 'a'
      | isUpper c = ord c - ord 'A'
      | otherwise = 0
    shift k c
      | isLower c = rotate 'a'
      | isUpper c = rotate 'A'
      | otherwise = c
      where
        rotate base = chr $ (ord c + k - ord base) `mod` 26 + ord base

-- takes into account spaces in plaintext too..
vigenere' :: String -> String -> String
vigenere' key = go (cycle key)
  where
    go _ [] = []
    go (k : ks) (c : cs)
      | isAlpha c = shift k c : go ks cs
      | otherwise = c : go (k : ks) cs

    shift k c
      | isUpper c = rotate 'A'
      | isLower c = rotate 'a'
      | otherwise = c
      where
        offset = ord (toUpper k) - ord 'A'
        rotate b = chr $ (ord c - ord b + offset) `mod` 26 + ord b

s = "meet at dawn"

k = "ALLY"

-- >>> vigenere' k s
-- "mppr ae oywy"
