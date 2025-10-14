import Data.Char (toUpper)
import Data.List (intercalate)
import Data.List.Split (splitOn)

-- binding t to (a, b) using @
f :: (Show a) => (a, b) -> IO (a, b)
f t@(a, _) = do
  print a
  return t

doubleUp [] = []
doubleUp xs@(x : _) = x : xs

-- >>> doubleUp []
-- >>> doubleUp [1]
-- >>> doubleUp [1,2]
-- []
-- [1,1]
-- [1,1,2]

infix 4 <<

(<<) :: (Eq a) => [a] -> [a] -> Bool
[] << _ = True
_ << [] = False
xs@(x : xs') << (y : ys)
  | x == y = xs' << ys
  | otherwise = xs << ys

-- >>> "blah" << "blahwoot"
-- >>> "blah" << "wootblah"
-- >>> "blah" << "wboloath"
-- >>> "blah" << "wootbla"
-- True
-- True
-- True
-- False

capitalizeWords :: String -> [(String, String)]
capitalizeWords = map go . words
  where
    go [] = ([], [])
    go s@(x : xs) = (s, toUpper x : xs)

-- >>>  capitalizeWords "hello world"
-- [("hello","Hello"),("world","World")]

capitalizeWord :: String -> String
capitalizeWord [] = []
capitalizeWord (x : xs) = toUpper x : xs

-- >>> capitalizeWord "Titter"
-- >>> capitalizeWord "titter"
-- "Titter"
-- "Titter"

capitalizeParagraph :: String -> String
capitalizeParagraph text = intercalate ". " capitalizedSentences
  where
    sentences = splitOn ". " text
    capitalizedSentences = map capitalizeWord sentences

-- >>> capitalizeParagraph "blah. woot ha."
-- "Blah. Woot ha."
