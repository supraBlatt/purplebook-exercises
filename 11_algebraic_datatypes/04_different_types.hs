-- depends on Price and Integer
data Price = Price Integer deriving (Eq, Show)

data Manufactorer = Mini | Mazda | Tata deriving (Eq, Show)

data Airline = PapuAir | CatapultsR'Us | TakeYourChancesUnites deriving (Eq, Show)

-- depends on Vehicle, Manufactorer, Price and Airline
data Vehicle = Car Manufactorer Price | Plane Airline deriving (Eq, Show)