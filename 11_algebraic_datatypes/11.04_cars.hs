-- depends on Price and Integer
data Price = Price Integer deriving (Eq, Show)

data Manufacturer = Mini | Mazda | Tata deriving (Eq, Show)

data Airline = PapuAir | CatapultsR'Us | TakeYourChancesUnites deriving (Eq, Show)

-- depends on Vehicle, Manufactorer, Price and Airline
data Vehicle = Car Manufacturer Price | Plane Airline PlaneSize deriving (Eq, Show)

data PlaneSize = Regional | NarrowBody | WideBody deriving (Eq, Show)

myCar = Car Mini (Price 14000)

urCar = Car Mazda (Price 20000)

clownCar = Car Tata (Price 7000)

doge = Plane PapuAir WideBody

isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _ = False

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane _ = False

areCars :: [Vehicle] -> [Bool]
areCars = map isCar

-- >>> areCars [myCar, urCar, clownCar, doge]
-- [True,True,True,False]

getManu :: Vehicle -> Manufacturer
getManu (Car m _) = m

-- >>> getManu doge
-- Non-exhaustive patterns in function getManu
