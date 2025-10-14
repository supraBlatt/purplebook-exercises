-- different datatypes to play with
data GuessWhat
  = Chickenbutt
  deriving (Eq, Show)

newtype Id a
  = MkId a
  deriving (Eq, Show)

-- how does a product Product a0...an look like? it's not just nested products right?
data Product a b
  = Product a b
  deriving (Eq, Show)

-- same q for Sum a0...an
data Sum a b
  = First a
  | Second b
  deriving (Eq, Show)

data RecordProduct a b
  = RecordProduct
  { pfirst :: a,
    psecond :: b
  }
  deriving (Eq, Show)

-- examples
newtype NumCow
  = NumCow Int
  deriving (Eq, Show)

newtype NumPig
  = NumPig Int
  deriving (Eq, Show)

data Farmhouse
  = Farmhouse NumCow NumPig
  deriving (Eq, Show)

-- cant define new typeclass instances for Farmhouse', but can for Farmhouse
type Farmhouse' = Product NumCow NumPig

-- still polymorphic. the a in (Id a) has has not been 'bound concretely'?
idIdentity :: Id (a -> a)
idIdentity = MkId $ \x -> x

-- >>> :t RecordProduct
-- RecordProduct :: a -> b -> RecordProduct a b
myRecord = RecordProduct 42 0.00001

myRecord1 =
  RecordProduct
    { pfirst = 42,
      psecond = 0.00001
    }
