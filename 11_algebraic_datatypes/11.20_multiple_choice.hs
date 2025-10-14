-- type with 5 constructors
data Weekday
  = Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday

f :: Weekday -> String
f Friday = "Miller Time"

-- data keyword types must begin with a capital letter
data Hi = HiNone

-- final element of xs
g xs = xs !! (length xs - 1)

-- >>> g [1,2,3]
-- 3
