data Employee =   Coder 
                | Manager 
                | Veep 
                | CEO 
                deriving (Eq, Ord, Show) 
-- >>> Coder < Manager
-- True

reportBoss :: Employee -> Employee -> String 
reportBoss e e' = show e ++ " is the boss of " ++ show e' 
-- >>> reportBoss Manager Coder
-- "Manager is the boss of Coder"

employeeRank :: Employee -> Employee -> String 
employeeRank e e' = case compare e e' of 
                    GT -> reportBoss e e' 
                    EQ -> "Neither is the boss" 
                    LT -> flip reportBoss e e'
-- >>> employeeRank Coder CEO
-- "CEO is the boss of Coder"

employeeRank' :: (Employee -> Employee -> Ordering) -> Employee -> Employee -> String 
employeeRank' cmp e e' = case cmp e e' of 
                         GT -> reportBoss e e' 
                         EQ -> "Neither is the boss"
                         LT -> reportBoss e' e 
-- >>> employeeRank' (flip compare) Coder Manager 
-- "Coder is the boss of Manager"

codersRule :: Employee -> Employee -> Ordering 
codersRule Coder Coder = EQ 
codersRule Coder _     = GT 
codersRule _ Coder     = LT 
codersRule e e'        = compare e e'
-- >>> employeeRank' codersRule Coder Manager
-- "Coder is the boss of Manager"
-- cool!!!