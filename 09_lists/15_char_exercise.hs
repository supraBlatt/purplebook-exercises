import Data.Char

-- >>> :t isUpper
-- isUpper :: Char -> Bool
-- >>> :t isLower
-- isLower :: Char -> Bool

onlyUp = filter isUpper

-- >>> onlyUp "HbEfLrLxO"
-- "HELLO"

cap [] = []
cap (c:s) = toUpper c : s 

-- >>> cap "Julie"
-- "Julie"

capAll = map toUpper

-- >>> capAll "woot"
-- "WOOT"

-- >>> :t head
-- head :: HasCallStack => [a] -> a

-- >>> head []
-- Prelude.head: empty list

cap1st = toUpper . head 

-- >>> cap1st "julie"
-- 'J'

-- >>> cap1st ""
-- Prelude.head: empty list
