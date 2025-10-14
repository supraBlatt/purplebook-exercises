data QuantumBool
  = QuantumTrue
  | QuantumFalse
  | QuantumBoth
  deriving (Eq, Show)

data TwoQs = MkTwoQs QuantumBool QuantumBool
  deriving (Eq, Show)

data Person = MkPerson String Int deriving (Eq, Show)

-- weeb looking aah
namae :: Person -> String
namae (MkPerson s _) = s

data Person'
  = Person'
  { name :: String,
    age :: Int
  }
  deriving (Eq, Show)

{-
uhh isnt this like lens?
no, lens let you mutate the 'object' too
also, we can't use 'name' anymore with record types
-}

-- >>> :t name
-- >>> :t Person'
-- name :: Person' -> String
-- Person' :: String -> Int -> Person'

data Fiction = Fiction deriving (Show)

data Nonfiction = Nonfiction deriving (Show)

data BookType
  = FictionBook Fiction
  | NonfictionBook Nonfiction
  deriving (Show)

type AuthorName = String

newtype Author = Author (AuthorName, BookType)

-- we can 'unpack' BookType and write Author in 'normal form'
-- A = AuthorName, F = Fiction, Nf = Nonfiction
-- (A * (F + Nf)) = A*F + A*Nf
data AuthorNF = Fiction' AuthorName | Nonfiction' AuthorName deriving (Eq, Show)

-- it's technically not in 'normal form' because we have not unpacked String either?

-- this is apparently in normal form?
data Expr
  = Number Int
  | Add Expr Expr
  | Minus Expr
  | Mult Expr Expr
  | Divide Expr Expr