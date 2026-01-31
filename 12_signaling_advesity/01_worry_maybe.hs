ifAdd2 n = if even n then Just (n + 2) else Nothing

-- >>> ifAdd2 14
-- Just 16

type Name = String

type Age = Integer

data Person = Person Name Age deriving (Show)

-- >>> Person "" (-1)
-- Person "" (-1)

-- one way to filter out the 'unreasonable' objects of this type
-- is to limit what is possible at the definition of the type.

-- or.. use maybe; only expose a constructor for the type that checks validity
-- is there a way to use 'proof obligations'?
mkPerson name age
  | name /= "" && age >= 0 = Just $ Person name age
  | otherwise = Nothing

-- >>> mkPerson "" 10
-- >>> mkPerson "john elden ring" 5
-- Nothing
-- Just (Person "john elden ring" 5)

data PersonInvalid
  = NameEmpty
  | AgeTooLow
  deriving (Eq, Show) -- not sure why eq

mkPerson' name age
  | name == "" = Left NameEmpty
  | age < 0 = Left AgeTooLow
  | otherwise = Right $ Person name age

-- >>> mkPerson' "" 10
-- >>> mkPerson' "John nightreign" (-1)
-- >>> mkPerson' "John nightreign" 100
-- Left NameEmpty
-- Left AgeTooLow
-- Right (Person "John nightreign" 100)

-- Error is on the left because of functor LMAO
-- you can't use it on the left type argument of either bc of the kind mismatch

type ValidatePerson a = Either [PersonInvalid] a

ageOk age = if age >= 0 then Right age else Left [AgeTooLow]

nameOk name = if name /= "" then Right name else Left [NameEmpty]

mkPerson'' name age =
    go (nameOk name) (ageOk age)
    where
        go (Right name) (Right age) = Right (Person name age)
        go (Left name) (Left age) = Left (name ++ age)
        go (Left name) _ = Left name
        go _ (Left age) = Left age

-- >>> mkPerson'' "John snow" (-1)
-- >>> mkPerson'' "" 10
-- >>> mkPerson'' "" (-1)
-- Left [AgeTooLow]
-- Left [NameEmpty]
-- Left [NameEmpty,AgeTooLow]

-- <*> :: forall (f :: Type -> Type) a b. Applicative f => f (a -> b) -> f a -> f b
-- <$> :: forall (f :: Type -> Type) a b. Functor f =>       (a -> b) -> f a -> f b
-- so <*> lets me chain applications..? and <$> doesn't
-- however, this implementation short-circuits on error
mkPerson3 name age = Person <$> nameOk name <*> ageOk age

-- >>> mkPerson3 "John" 10
-- >>> mkPerson3 "" (-1)
-- Right (Person "John" 10)
-- Left [NameEmpty]

-- Person :: Name -> (Age -> Person) 
-- nameOk :: Name -> Either [Err] Name
-- ageOk  :: Age  -> Either [Err] Age

-- (Person <$> Left [NameEmpty]) <*> Left [AgeTooLow]
-- Left [NameEmpty] <*> Left [AgeTooLow]
-- Left [NameEmpty]
-- instead of Left ([NameEmpty] ++ [AgeTooLow])

-- the Validation type from Data.Validation seems to make <*> ACCUMULATE errors
-- so we swap Either with that later down the road.
