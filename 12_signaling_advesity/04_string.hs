import Data.ByteString (intercalate)
import Data.Maybe (mapMaybe, fromMaybe, isNothing)

notThe :: String -> Maybe String
notThe s = if s == "the" then Nothing else Just s

-- this is cool asfuck
delimit :: Char -> String -> [String]
delimit c = foldr go [""]
  where
    go ch acc
      | ch == c   = "" : acc
      | otherwise = (ch : head acc) : tail acc

-- >>> delimit "abcd,efgh" ','
-- ["abcd","efgh"]

replaceThe =  unwords . map (fromMaybe "a" . notThe) . words

-- >>> replaceThe "the cow"
-- "a cow"

isVowel c = c `elem` "aeiouAEIOU"
countTheBeforeVowel  = length . filter signal . pairs . words 
  where
    pairs a = zip a (tail a) 
    signal (s1, s2) = s1 == "the" && isVowel (head s2) 
-- >>> countTheBeforeVowel "the evil cow"
-- 1

countVowels = length . filter isVowel
-- >>> countVowels "Mikolajczak"
-- 4

mkWord s 
  | length s <= 2 * countVowels s = Nothing
  | otherwise = Just s

