-- bad
data Automobile'
  = Null'
  | Car'
      { make' :: String,
        model' :: String,
        year' :: Integer
      }
  deriving (Eq, Show)

-- >>> make' Null
-- Data constructor not in scope: Null :: Automobile'

data Car = Car
  { make :: String,
    model :: String,
    year :: Integer
  }
  deriving (Eq, Show)

data Automobile
  = Null
  | Automobile Car
  deriving (Eq, Show)

-- >>> make Null
-- Couldn't match expected type `Car' with actual type `Automobile'
-- In the first argument of `make', namely `Null'
