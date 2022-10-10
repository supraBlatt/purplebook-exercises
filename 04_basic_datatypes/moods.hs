data Mood = Blah | Woot deriving Show  -- instance of Show typeclass?

changeMood :: Mood -> Mood 
changeMood Blah = Woot
changeMood    _ = Blah

-- >>> changeMood Woot
-- Blah
-- >>> changeMood HI
-- Data constructor not in scope: HI :: Mood
