import Data.IntMap (differenceWith)

--  The cardinality of a datatype is the number of possible values it defines. Combinatorics™️
{-
One can calculate the cardinality of an algebraic type by:
+ data A ... = A0 .. | A1 .. | ... | An ..
  then

  |A| = ||A0 ..|| + .. + ||An ..||
  and

  ||A0 a0...an || = |a0| * ... * |an|
-}

{-
note that for function, dependent, and refinement types it's different

for ex for a function |f : a -> b| = |b|^|a|.
functions are left associative here, so
\|f : a0 -> ... -> an|
= |f : a0 -> (... -> an)|
=by induction= |an|^(|a0| * ... * |an-1|)

a product type is a specific case of a function type I guess?
-}

data Example = MakeExample deriving (Show)

-- >>> :info Example
-- type Example :: *
-- data Example = MakeExample
-- instance Show Example
data Example1 = MakeExample1 Int deriving (Show)

-- >>> :info Example1
-- type Example1 :: *
-- data Example1 = MakeExample1 Int
-- instance Show Example1

-- >>> :t MakeExample1
-- MakeExample1 :: Int -> Example1
