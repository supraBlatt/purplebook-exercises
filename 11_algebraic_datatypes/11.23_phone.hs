import Data.Char (isUpper, toLower)
import Data.Foldable (find)
import Data.Function (on)
import Data.List (elemIndex, groupBy, maximumBy, sortOn)
import Data.Maybe (fromMaybe)

newtype DaPhone = DaPhone [(Char, String)]

-- note that this cannot express repeated digits besides 1
-- this usually comes from a timing delay but we don't have that here
phone =
  DaPhone
    [ ('1', ""),
      ('2', "abc"),
      ('3', "def"),
      ('4', "ghi"),
      ('5', "jkl"),
      ('6', "mno"),
      ('7', "pqrs"),
      ('8', "tuv"),
      ('9', "wxyz"),
      ('*', "^"),
      ('0', " +-"),
      ('#', ".,")
    ]

-- validButtons = "1234567890*#"
type Digit = Char

-- Valid presses: 1 and up
type Presses = Int

getDigitIn :: DaPhone -> Char -> Maybe (Digit, String)
getDigitIn (DaPhone p) c = find inPhone p
  where
    inPhone (a, b) =
      c `elem` (a : b)

pressDigitFor :: (Digit, String) -> Char -> Maybe (Digit, Presses)
pressDigitFor (d, cs) c =
  c `elemIndex` (cs ++ [d])
    >>= \n -> Just (d, n + 1)

-- this matches the first occurence.. if multiple exist in phone
findDigitPresses :: DaPhone -> Char -> Maybe (Digit, Presses)
findDigitPresses (DaPhone p) c =
  getDigitIn (DaPhone p) c
    >>= \cs -> pressDigitFor cs c

-- >>> findDigitPresses phone '0'
-- Just ('0',4)

convo =
  [ "Wanna play 20 questions",
    "Ya",
    "would you suck dick for $20?",
    "$20 is $20",
    "real"
  ]

reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps phone c
  | isUpper c = [('*', 1), findPhone c]
  | otherwise = [findPhone c]
  where
    findPhone = fromMaybe ('?', 0) . findDigitPresses phone . toLower

cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)]
cellPhonesDead phone = concatMap (reverseTaps phone)

-- >>> map (cellPhonesDead phone) convo
-- [[('*',1),('9',1),('2',1),('6',2),('6',2),('2',1),('0',1),('7',1),('5',3),('2',1),('9',3),('0',1),('2',4),('0',4),('0',1),('7',2),('8',2),('3',2),('7',4),('8',1),('4',3),('6',3),('6',2),('7',4)],[('*',1),('9',3),('2',1)],[('*',1),('8',2),('0',1),('1',1),('7',4),('8',1),('0',1),('4',2),('2',1),('4',2),('2',1)],[('*',1),('5',3),('6',3),('5',3),('0',1),('6',3),('5',2),('#',1),('0',1),('*',1),('4',2),('2',1),('8',3),('3',2),('0',1),('8',2),('0',1),('3',2),('8',3),('3',2),('7',3),('0',1),('8',1),('2',1),('7',4),('8',1),('3',2),('3',1),('0',1),('2',1),('5',3),('2',3),('6',3),('4',2),('6',3),('5',3),('0',1),('5',3),('6',3),('5',3)],[('*',1),('5',3),('6',3),('5',3),('0',1),('9',3),('2',1)],[('*',1),('9',1),('6',3),('9',1),('0',1),('8',2),('7',3),('0',1),('2',3),('6',3),('6',3),('5',3),('0',1),('4',2),('2',1),('4',2),('2',1),('#',1),('0',1),('*',1),('8',2),('7',3),('0',1),('8',1),('8',2),('7',3),('6',2)],[('*',1),('6',3),('5',2),('#',1),('0',1),('*',1),('3',1),('6',3),('0',1),('8',2),('0',1),('8',1),('4',2),('4',3),('6',2),('5',2),('0',1),('*',1),('4',3),('0',1),('2',1),('6',1),('0',1),('7',1),('7',3),('3',2),('8',1),('8',1),('9',3),('0',1),('*',1),('5',3),('6',3),('5',3)],[('*',1),('5',3),('6',3),('5',3),('0',1),('9',3),('2',1)],[('*',1),('4',2),('2',1),('4',2),('2',1),('0',1),('8',1),('4',2),('2',1),('6',2),('5',2),('7',4),('0',1),('5',1),('8',2),('7',4),('8',1),('0',1),('6',1),('2',1),('5',2),('4',3),('6',2),('4',1),('0',1),('7',4),('8',2),('7',3),('3',2),('0',1),('7',3),('6',3),('3',3),('5',3),('0',1),('8',2),('7',3),('0',1),('8',1),('8',2),('7',3),('6',2)]]

fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps = sum . map snd

mostPopularLetter :: String -> Char
mostPopularLetter str = fst $ maximumBy (compare `on` snd) sums
  where
    taps = cellPhonesDead phone str
    -- Sort fully by digit to guarantee adjacent keys
    sorted = sortOn fst taps
    grouped = groupBy ((==) `on` fst) sorted
    sums = map (\grp -> (fst (head grp), sum (map snd grp))) grouped

-- >>> mostPopularLetter "abcdefd"
-- '3'
