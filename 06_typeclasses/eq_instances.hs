-- 1
data TisAnInteger = 
    TisAn Integer

instance Eq TisAnInteger where 
    (==) (TisAn v) (TisAn v') = (==) v v'
-- >>> TisAn 1 == TisAn 2
-- False

-- 2
data TwoIntegers = 
    Two Integer Integer 

instance Eq TwoIntegers where 
    (==) (Two a b) (Two a' b') = (==) a a' && (==) b b'
-- >>> Two 1 2 == Two 1 2
-- True

-- 3
data StringOrInt = 
    TisAnInt Int 
    | TisAString String

-- unsure about that one ngl
instance Eq StringOrInt where 
    (==) (TisAnInt a) (TisAnInt a')      = (==) a a'
    (==) (TisAString a) (TisAString a')  = (==) a a'
    (==) _ _                             = False 
-- >>> TisAString "hi" == TisAnInt 1
-- False

-- 4 
data Pair a = 
    Pair a a 

instance Eq a => Eq (Pair a) where 
    (==) (Pair a b) (Pair a' b') = (==) a a' && (==) b b' 
-- >>> Pair 4 5 == Pair 4 5
-- True

-- 5 
data Tuple a b = 
    Tuple a b 

instance (Eq a, Eq b) => Eq (Tuple a b) where 
    (==) (Tuple a b) (Tuple a' b') = (==) a a' && (==) b b'

-- >>> Tuple 4 5 == Tuple 6 5
-- False

-- 6
data Which a = 
    ThisOne a 
    | ThatOne a 

instance Eq a => Eq (Which a) where 
    (==) (ThisOne a) (ThisOne a') = (==) a a' 
    (==) (ThatOne a) (ThatOne a') = (==) a a' 
    (==) _ _                      = False 

-- >>> ThisOne 4 == ThatOne 4 
-- >>> ThisOne 5 == ThisOne 5
-- False
-- True

-- 7 
data EitherOr a b = 
    Hello a 
    | Goodbye b 

instance (Eq a, Eq b) => Eq (EitherOr a b) where 
    (==) (Hello a) (Hello a')      = (==) a a' 
    (==) (Goodbye b) (Goodbye b')  = (==) b b' 
    (==) _ _                       = False 

-- >>> Hello 4 == Hello 7
-- False