-- higher kinded means taking the same thing as arguments?
-- higher kinded functions = takes functions arguments too
-- higher kinded type = takes type arguments

-- >>> :k Int
-- >>> :k Bool
-- >>> :k Char
-- Int :: *
-- Bool :: *
-- Char :: *

data Ex a = Blah | Woot a
-- >>> :k Ex
-- Ex :: * -> *

-- lifted type = has BOTTOM as an instance, marked with *s
-- unlifted    = no  BOTTOM as an instance, marked with #s
-- exception: newtype has kind * but is unlifted.

-- >>> :k Maybe Maybe
-- Expecting one more argument to `Maybe'
-- Expected a type, but `Maybe' has kind `Type -> Type'
-- In the first argument of `Maybe', namely `Maybe'
-- In the type `Maybe Maybe'

-- Maybe expects a single argument of kind *, but Maybe is of kind * -> *

-- >>> :k Maybe (Maybe Char)
-- Maybe (Maybe Char) :: *
