import Data.Time (UTCTime (UTCTime), fromGregorian, secondsToDiffTime)
import Language.Haskell.TH (match)
import Data.Binary.Get (label)

-- why do I need ord lol
data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)

theDatabase = 
  [ DbDate (UTCTime
           (fromGregorian 1911 5 1)
       (secondsToDiffTime 34123))
  , DbNumber 9001
  , DbNumber 9002
  , DbString "Hello, world!"
  , DbDate (UTCTime
           (fromGregorian 1921 5 1)
       (secondsToDiffTime 34123))
  ]

-- >>> theDatabase
-- [DbDate 1911-05-01 09:28:43 UTC,DbNumber 9001,DbString "Hello, world!",DbDate 1921-05-01 09:28:43 UTC]

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate ts = [t | DbDate t <- ts]
-- >>> filterDbDate theDatabase
-- [1911-05-01 09:28:43 UTC,1921-05-01 09:28:43 UTC]

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber ns = [n | DbNumber n <- ns]
-- >>> filterDbNumber theDatabase
-- [9001]

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate
-- >>> mostRecent theDatabase
-- 1921-05-01 09:28:43 UTC


-- these assume the list has AT LEAST one DbNumber. otherwise use Maybe..?
sumDb :: [DatabaseItem] -> Integer
sumDb = sum . filterDbNumber
-- >>> sumDb theDatabase
-- 9001

avgDb :: [DatabaseItem] -> Double
avgDb ns = fromIntegral s / fromIntegral c
  where s = sum l
        c = length l
        l = filterDbNumber ns

-- >>> avgDb theDatabase
-- 9001.5

