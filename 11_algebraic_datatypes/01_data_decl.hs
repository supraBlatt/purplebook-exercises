{- 
  + [data] is a keyword. signals a data\datatype *decleration* follows.
  + [=] divides the *type constructor* from the *data constructors*
  + [|] is a logical disjunction in what values a type can have aka *sumtype*
  + each data constructor has a name
-}
data MyBool = False | True

-- here the *type constructor* has an argument type
-- in Coq: inductive MyList (A : Type) := | nil : MyList A | cons : A -> MyList A -> MyList A
data MyList a = MyNil | MyCons a (MyList a)

data Trivial = Trivial'
data UnaryTypeCon a = UnaryValueCon a
