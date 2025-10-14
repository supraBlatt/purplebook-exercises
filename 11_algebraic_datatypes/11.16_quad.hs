-- | Quad| = 4
data Quad
  = One
  | Two
  | Three
  | Four
  deriving (Eq, Show)

-- | Quad| + |Quad| = 8 options
eQuad :: Either Quad Quad
eQuad = undefined

-- | Quad| * |Quad| =  16 options
prodQuad :: (Quad, Quad)
prodQuad = undefined

-- | Quad|^|Quad| = 256 options
funcQuad :: Quad -> Quad
funcQuad = undefined

-- | Bool| * |Bool| * |Bool| = 8 options
prodTBool :: (Bool, Bool, Bool)
prodTBool = undefined

-- | Bool|^(|Bool| * |Bool|) = 16
gTwo :: Bool -> Bool -> Bool
gTwo = undefined

-- | Quad|^(|Bool| * |Quad|) = 4^(8) = (2^2)^8 = 2^16 = 65,536
fTwo :: Bool -> Quad -> Quad
fTwo = undefined