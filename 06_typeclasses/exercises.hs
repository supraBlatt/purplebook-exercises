-- Multiple Choice --
-- 1.   Eq makes equality test possible 
-- 2.   Ord is a subclass of Eq 
-- 3.   (>) :: Ord a => a -> a -> Bool 
-- 4.   x = divMod 16 12 .  x :: Integral a => (a, a)
-- 5.   Integral includes Int and Integer numbers 

-- Does it typecheck? --
-- 1 
newtype Person = 
    Person Bool 
    deriving Show 

printPerson :: Person -> IO () 
printPerson person = putStrLn (show person)

-- 2 
data Mood = Blah 
          | Woot
          deriving (Show, Eq)

settleDown :: Mood -> Mood
settleDown x = if x == Woot then Blah else x

-- 3 
-- >>> settleDown Woot
-- Blah
-- >>> Blah > Woot
-- No instance for (Ord Mood) arising from a use of ‘>’

-- 4 
type Subject = String 
type Verb = String 
type Object = String 

data Sentence = 
    Sentence Subject Verb Object
    deriving (Eq, Show) 

s1 = Sentence "dogs" "drool" 
s2 = Sentence "Julie" "loves" "dogs"
-- >>> s1
-- No instance for (Show (Object -> Sentence))
--   arising from a use of ‘evalPrint’
--   (maybe you haven't applied a function to enough arguments?)

-- >>> s2
-- Sentence "Julie" "loves" "dogs"

-- Datatypes --
newtype Rocks = Rocks String       
                deriving (Eq, Show) 
            
newtype Yeah = Yeah Bool           
               deriving (Eq, Show) 

data Papu = Papu Rocks Yeah        
            deriving (Eq, Show) 

equalityForall :: Papu -> Papu -> Bool 
equalityForall p p' = p == p'
-- comparing papus not working since there's no Ord to either Rocks or Yeah ?
