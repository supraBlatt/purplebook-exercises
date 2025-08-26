import Data.Char (isSpace)
-- >>> :t take
-- >>> :t drop
-- >>> :t splitAt
-- take :: Int -> [a] -> [a]
-- drop :: Int -> [a] -> [a]
-- splitAt :: Int -> [a] -> ([a], [a])

-- >>> :t takeWhile
-- >>> :t dropWhile
-- takeWhile :: (a -> Bool) -> [a] -> [a]
-- dropWhile :: (a -> Bool) -> [a] -> [a]

f :: a -> Bool
f _ = f undefined
-- >>> f 1

-------------------------------------------------

-- Exercise: Thy Fearful Symmetry -- 

-- I think this sucks complexity wise?
myWords :: Char -> String -> [String]
myWords _ "" = []
myWords sep s
  | null w    =     myWords sep rest'
  | otherwise = w : myWords sep rest'
  where notSpace = (/=sep)
        w        = takeWhile notSpace s
        rest     = dropWhile notSpace s
        rest'    = dropWhile isSpace rest 

-- test for myself?

-- >>> myWords ' ' "all i wanna do is have some fun"
-- ["all","i","wanna","do","is","have","some","fun"]

-- >>> myWords ' ' "                "
-- []

-- Part 2 !! 

firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen :: String
thirdSen = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful symmetry?"
sentences = firstSen ++ secondSen
         ++ thirdSen ++ fourthSen

myLines :: String-> [String]
myLines = myWords '\n'

shouldEqual =
  [ "Tyger Tyger, burning bright"
  , "In the forests of the night"
  , "What immortal hand or eye"
  , "Could frame thy fearful symmetry?"
  ]

-- >>> myLines sentences == shouldEqual
-- True

-- Part 3 !!! 
-- oh i already kinda did it by adding a delim to myWords..
