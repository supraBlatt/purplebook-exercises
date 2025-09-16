module Cipher where 

import Data.Char

-- >>> :t ord
-- ord :: Char -> Int

-- >>> :t chr
-- chr :: Int -> Char


ceaser = map shift 
    where shift c
            | isSpace c = c
            | otherwise = 