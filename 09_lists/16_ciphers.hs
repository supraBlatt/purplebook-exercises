module Cipher where 

import Data.Char

-- >>> :t ord
-- ord :: Char -> Int

-- >>> :t chr
-- chr :: Int -> Char

-- I think it magically works with mod and not rem for negative numbers..
ceaser k = map (shift k)
    where shift k c
            | isLower c = rotate 'a' k c
            | isUpper c = rotate 'A' k c
            | otherwise = c
          rotate b k c = toEnum $ (+fromEnum b) $ (fromEnum c + k - fromEnum b) `mod` 26

-- (c + k)
-- [97, 122]

unCeaser k = ceaser (-k)

s = "If he had anything confidential to say, \
    \he wrote it in cipher, that is, \
    \by so changing the order of the letters of the alphabet, \
    \that not a word could be made out."

short = "If"
-- >>> unCeaser 7 . ceaser 7 $ s
-- "If he had anything confidential to say, he wrote it in cipher, that is, by so changing the order of the letters of the alphabet, that not a word could be made out."
