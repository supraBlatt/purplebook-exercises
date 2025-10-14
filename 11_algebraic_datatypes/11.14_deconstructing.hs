newtype Name = Name String deriving (Show)

newtype Acres = Acres Int deriving (Show)

data FarmerType
  = DairyFarmer
  | WheatFarmer
  | SoybeanFarmer
  deriving (Show)

data Farmer = Farmer Name Acres FarmerType deriving (Show)

isDairyFarmer (Farmer _ _ DairyFarmer) = True
isDairyFarmer _ = False

data FarmerRec
  = FarmerRec
  { name :: Name,
    acres :: Acres,
    farmerType :: FarmerType
  }
  deriving (Show)

isDairyFarmer' (FarmerRec _ _ DairyFarmer) = True
isDairyFarmer' _ = False

isDairyFarmer'' farmer = case farmerType farmer of
  DairyFarmer -> True
  _ -> False