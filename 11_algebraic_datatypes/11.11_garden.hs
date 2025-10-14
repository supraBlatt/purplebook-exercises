data FlowerType
  = Gardenia
  | Daisy
  | Rose
  | Lilac
  deriving (Show)

type Gardener = String

data Garden = Garden Gardener FlowerType deriving (Show)

-- what is the normal form of Garden?
-- data Garden' = Gardenia Gardener | Daisy Gardener | ...