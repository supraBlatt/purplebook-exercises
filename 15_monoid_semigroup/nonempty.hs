data NonEmpty' a = a :| [a]
  deriving (Eq, Ord, Show)

-- >>> :t (:|)
-- (:|) :: a -> [a] -> NonEmpty' a

instance Semigroup(NonEmpty' a) where
  (x :| xs) <> (y :| ys) = x :| (xs <> (y:ys))

-- >>> (1 :| [2,3]) <> (4 :| [5,6])
-- 1 :| [2,3,4,5,6]
