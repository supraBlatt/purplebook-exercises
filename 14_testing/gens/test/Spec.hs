import Test.QuickCheck

main :: IO ()
main = putStrLn "Test suite not yet implemented"

data Fool = Fulse | Frue deriving (Eq, Show)

genUniFool :: Gen Fool
genUniFool = oneof [return Fulse, return Frue]

-- >>> sample' genUniFool
-- [Frue,Fulse,Frue,Frue,Fulse,Frue,Frue,Fulse,Fulse,Fulse,Fulse]

gen13Fool :: Gen Fool
gen13Fool = frequency [(2,return Fulse), (1,return Frue)]

-- >>> sample' gen13Fool
-- [Fulse,Frue,Fulse,Frue,Fulse,Fulse,Frue,Frue,Fulse,Fulse,Fulse]