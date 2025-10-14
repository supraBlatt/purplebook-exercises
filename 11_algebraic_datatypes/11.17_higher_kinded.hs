-- >>> :k []
-- [] :: * -> *

data Silly a b c d = MkSilly a b c d deriving (Show)

-- >>> :k Silly
-- Silly :: * -> * -> * -> * -> *

-- >>> :k Silly Int
-- Silly Int :: * -> * -> * -> *

-- >>> :k Silly Int String
-- Silly Int String :: * -> * -> *

-- >>> :k (,,,)
-- (,,,) :: * -> * -> * -> * -> *

-- >>> :k (Int, String, Bool, String)
-- (Int, String, Bool, String) :: *