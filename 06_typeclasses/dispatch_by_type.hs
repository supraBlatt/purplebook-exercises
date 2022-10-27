-- typeclass? book says it's a bad impl
-- typeclass instances are unique pairings 
-- of the type-class and class
{-# LANGUAGE InstanceSigs #-}
class Numberish a where 
    fromNumber :: Integer -> a
    toNumber :: a -> Integer 

-- type 1
newtype Age = 
    Age Integer 
    deriving (Eq, Show)

-- >>> Age 11
-- Age 11
-- showable

instance Numberish Age where 
    fromNumber :: Integer -> Age
    fromNumber n = Age n 
    toNumber (Age n) = n

-- type 2
newtype Year = 
    Year Integer 
    deriving (Eq, Show) 

instance Numberish Year where 
    fromNumber n = Year n 
    toNumber (Year n) = n 

sumNumberish :: Numberish a => a -> a -> a
sumNumberish a b = fromNumber summed 
                   where intA = toNumber a 
                         intB = toNumber b 
                         summed = intA + intB 

-- >>> sumNumberish (Age 1) (Age 2)
-- >>> sumNumberish (Year 4) (Year 3)
-- Age 3
-- Year 7
-- >>> sumNumberish (Year 4) (Age 1)
-- Couldn't match expected type ‘Year’ with actual type ‘Age’
