data Example0 = Example0 deriving (Eq, Show)

data Example1 = Example1 Int deriving (Eq, Show)

data Example2 = Example2 Int String deriving (Eq, Show)

-- Example2 is a *product* data constructor. it has arity >=2.
-- Example1 is a unary data constructor.
-- >>> :t Example1
-- Example1 :: Int -> Example1
