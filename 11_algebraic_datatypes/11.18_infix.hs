data Product a b
  = a :& b
  deriving (Eq, Show)

-- >>> :t 1 :& 2
-- 1 :& 2 :: (Num a, Num b) => Product a b

-- prepending (:) to a constructor name makes it infix?
