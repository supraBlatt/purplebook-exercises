data PenguinsLive = 
      Galapagos
    | Anarctica
    | Australia 
    | SouthAfrica
    | SouthAmerica 
    deriving (Eq, Show)

newtype Penguin = Peng PenguinsLive deriving (Eq, Show) 

isSouthAfrica :: PenguinsLive -> Bool 
isSouthAfrica SouthAfrica = True 
isSouthAfrica _           = False 
-- >>> isSouthAfrica Australia
-- False

gimmeLocation :: Penguin -> PenguinsLive 
gimmeLocation (Peng whereitlives) = whereitlives 
-- >>> gimmeLocation $ Peng Galapagos
-- Galapagos

galapagosPenguin :: Penguin -> Bool 
galapagosPenguin (Peng Galapagos) = True 
galapagosPenguin _                = False 
-- >>> galapagosPenguin $ Peng Australia
-- False

-- >>> :i (||)
-- (||) :: Bool -> Bool -> Bool 	-- Defined in ‘GHC.Classes’
-- infixr 2 ||
