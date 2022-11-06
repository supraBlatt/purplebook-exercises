newtype Username = Username String 
newtype AccountNumber = AccountNumber Integer 

-- sum type between registered and unregistered
-- can use pattern matching to unpack registered?
data User = Unregistered | Registered Username AccountNumber 

printUser :: User -> String 
printUser Unregistered = "Unregistered"
printUser (Registered (Username name) (AccountNumber num)) = 
           name ++ " " ++ show num

-- >>> printUser $ Registered (Username "hi") (AccountNumber 1)
-- "hi 1"
