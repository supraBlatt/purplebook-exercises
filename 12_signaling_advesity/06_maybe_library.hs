isJust :: Maybe a -> Bool
isJust (Just a) = True
isJust _ = False

isNothing :: Maybe a -> Bool
isNothing = not . isJust

-- >>> isNothing Nothing
-- True

mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee _ f (Just a) = f a
mayybee b _ Nothing = b

-- >>> mayybee 0 (+1) Nothing
-- >>> mayybee 0 (+1) (Just 1)
-- 0
-- 2

fromMaybe :: a -> Maybe a -> a
fromMaybe _ (Just a) = a
fromMaybe a _ = a

listToMaybe :: [a] -> Maybe a
listToMaybe [] = Nothing
listToMaybe (x:_) = Just x

maybeToList :: Maybe a -> [a]
maybeToList = mayybee [] (:[])
-- >>> maybeToList (Just 1)
-- >>> maybeToList Nothing
-- [1]
-- []

-- this is my coq mapOption lol
catMaybes :: [Maybe a] -> [a]
catMaybes = foldr (\m acc -> case m of Just x -> x : acc; Nothing -> acc) []

flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe = foldr (\m acc -> (:) <$> m <*> acc) (Just [])
