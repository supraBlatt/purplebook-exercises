
-- add deriving Show for printing?
data DayOfWeek = 
    Sun | Mon | Tue | Weds | Thu | Fri | Sat

data Date = 
    Date DayOfWeek Int -- some error about lazy types

-- oh boi 
instance Eq DayOfWeek where 
    (==) Sun Sun    = True 
    (==) Mon Mon    = True 
    (==) Tue Tue    = True 
    (==) Weds Weds  = True 
    (==) Thu Thu    = True 
    (==) Fri Fri    = True 
    (==) Sat Sat    = True 
    (==) _ _        = False -- default case? 

instance Eq Date where 
    (==) (Date weekday day) 
         (Date weekday' day') = 
        weekday == weekday' && day == day' -- using both of the other equalities ig
    
-- >>> Date Thu 10 == Date Thu 10 
-- >>> Date Thu 10 == Date Thu 11
-- True
-- False

-- >>> Date Thu 10
-- No instance for (Show Date) arising from a use of ‘evalPrint’
-- >>> :t Date Thu 10
-- Date Thu 10 :: Date