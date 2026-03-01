ha = Just ["Ha", "Ha"]
lmls = [ha, Nothing, Just []]

-- >>> (fmap . fmap . fmap . fmap) (const 'p') lmls
-- [Just ["pp","pp"],Nothing,Just []]

rp :: b -> Char
rp = const 'p'

lms :: [Maybe String]
lms = [Just "Ave", Nothing, Just "woohoo"]

liftedRp :: Functor f => f a -> f Char
liftedRp = fmap rp

liftedTwice :: (Functor f1, Functor f) => f (f1 a) -> f (f1 Char)
liftedTwice = (fmap . fmap) rp

-------------

a :: [Int]
a = fmap (+1) $ read "[1]"
-- >>> a
-- [2]

b :: Maybe [[Char]]
b = (fmap . fmap) (++ "lol") (Just ["Hi,", "Hello"]) 
-- >>> b
-- Just ["Hi,lol","Hellolol"]

c :: Int -> Int
c = (*2) . (\x -> x - 2)
-- >>> c 1
-- -2

-- equiv to fmap at the start
d :: Int -> String
d = ((return '1' ++) . show) . ((\x -> [x, 1..3]) :: Int -> [Int])

-- >>> :t fmap ((return '1' ++) . show)
-- fmap ((return '1' ++) . show) :: (Functor f, Show a) => f a -> f [Char]

-- >>> d 0
-- "1[0,1,2,3]"

e :: IO Integer
e = let ioi = readIO "1" :: IO Integer
        changed = fmap (read. ("123"++) . show) ioi
    in fmap (*3) changed

-- >>> e
-- 3693
