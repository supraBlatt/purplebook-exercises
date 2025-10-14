import Text.XHtml (base)

data MyList a = MyNil | MyCons a (MyList a)

-- >>> :k MyList
-- MyList :: * -> *

-- >>> :k MyList Bool
-- MyList Bool :: *

-- only for types
-- >>> :k MyNil
-- Not in scope: type constructor or class `MyNil'

-- hidden forall a
-- >>> :t MyNil
-- MyNil :: MyList a

-- but can also have the same name..
data DogueDeBordeaux doge = DogueDeBordeaux doge

-- >>> :k DogueDeBordeaux
-- DogueDeBordeaux :: * -> *

-- >>> :t DogueDeBordeaux
-- DogueDeBordeaux :: doge -> DogueDeBordeaux doge

data HuskyType a = HuskyValue

husk1 = HuskyValue :: HuskyType b

husk2 = HuskyValue :: (Num b) => HuskyType b
