-- oh my god i love partial application
addStuff :: Num a => a -> a -> a
addStuff a b = a + b + 5
-- >>> let addTen =  addStuff 5
-- >>> :t addTen
-- >>> addTen 5
-- addTen :: Num a => a -> a
-- 15

substractStuff :: Num a => a -> a -> a
substractStuff x y = x - y - 10

-- >>> let substractOne = substractStuff 1
-- >>> :t substractOne
-- >>> substractOne 11
-- substractOne :: Num a => a -> a
-- -20

-- seems like you can uncurry them yourself
-- or use lambdas
