import Data.Maybe (mapMaybe)
import Control.Arrow ((&&&))
lefts1 :: [Either a b] -> [a]
lefts1 [] = []
lefts1 (Left a : es) = a : lefts1 es
lefts1 (_ : es) = lefts1 es

-- >>> lefts1 [Left 1, Left 2, Right 1, Left 3]
-- [1,2,3]

-- lefts2:: [Either a b] -> [a]
-- lefts2 = foldr (\e acc -> case e of Left a -> a:acc; _ -> acc) []
-- lefts2 = foldr (\e acc -> either (:acc) (const acc) e) []

-- >>> lefts2 [Left 1, Left 2, Right 1, Left 3]
-- [1,2,3]

-- this is so smart lmao
lefts' :: [Either a b] -> [a]
lefts' = mapMaybe (either Just (const Nothing))

rights' :: [Either a b] -> [b]
rights' = foldr (\e acc -> either (const acc) (:acc) e) []

-- >>> rights' [Left 1, Left 2, Right 1, Left 3]
-- [1]

partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' = lefts' &&& rights'

-- >>> partitionEithers' [Left 1, Left 2, Right 1, Left 3]
-- ([1,2,3],[1])

eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' f = either (const Nothing) (Just . f)

-- eitherMaybe' f (Left _)  = Nothing
-- eitherMaybe' f (Right b) = Just (f b)
-- >>> eitherMaybe' (+1) (Left 1)
-- >>> eitherMaybe' (+1) (Right 2)
-- Nothing
-- Just 3

either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' f _ (Left a) = f a
either' _ g (Right b) = g b
