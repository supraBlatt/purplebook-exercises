import Data.Int (Int8)

data BigSmall = Big Bool | Small Bool deriving (Eq, Show)

-- | BigSmall| = ||Big Bool|| + ||Small Bool|| = |Bool| + |Bool| = 4
data NumberOrBool = Numba Int8 | BollyBool Bool deriving (Eq, Show)

-- | NumberOrBool| = ||Numba Int8|| + ||BollyBool Bool|| = |Int8| + |Bool| = 256 + 2 = 258

-- >>>Numba (255)
-- Numba (-1)
