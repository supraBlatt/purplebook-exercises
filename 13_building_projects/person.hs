type Name = String
type Age = Integer
data Person = Person Name Age deriving Show

data PersonInvalid = NameEmpty
    | AgeTooLow
    | PersonInvalidUnknown String
    deriving (Eq, Show)

mkPerson :: Name -> Age -> Either PersonInvalid Person
mkPerson name age
    | name /= "" && age > 0 = Right $ Person name age
    | name == "" = Left NameEmpty
    | not (age > 0) = Left AgeTooLow
    | otherwise = Left $ PersonInvalidUnknown $
                    "Name was: " ++ show name ++
                    " Age was: " ++ show age

main :: IO ()
main = do 
        putStrLn "Name?"
        name <- getLine :: IO String
        putStrLn "Age?"
        age <- readLn :: IO Integer
        case mkPerson name age of
            Right _ -> putStrLn "yay!"
            Left err -> putStrLn $ "error" ++ show err 

