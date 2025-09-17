import Data.Array.Base (mapArray)
import Data.Maybe
-- these are really just folds
and' [] = True
and' (x:xs) = x && and' xs

or' [] = False
or' (x:xs) = x || or' xs

any' _ [] = False
any' f (x:xs) = f x || any' f xs

-- >>> any' even [1,3,5]
-- False

-- >>> any' odd [1,3,5]
-- True

elem' _ [] = False
elem' v (x:xs) = v == x || elem' v xs

elem'' v = any' (==v)

-- >>> elem'' 1 [2..10]
-- False

-- not tail recursive
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

-- >>> reverse' "blah"
-- "halb"

-- reverse' "blah"
-- reverse' "lah" ++ ["b"]
-- (reverse' "ah" ++ ["l"]) ++ ["b"]
-- ((reverse' "h" ++ ["a"]) ++ ["l"]) ++ ["b"]
-- (((reverse' "" ++ ["h"]) ++ ["a"]) ++ ["l"]) ++ ["b"]
-- ((([] ++ ["h"]) ++ ["a"]) ++ ["l"]) ++ ["b"]
-- ((["h"] ++ ["a"]) ++ ["l"]) ++ ["b"]
-- (["ha"] ++ ["l"]) ++ ["b"]
-- ["hal"] ++ ["b"]
-- ["halb"]


-- tail recursive O(n)
reverse'' xs = go xs []
    where go [] acc = acc 
          go (x:xs) acc = go xs (x : acc)


flatten' xs = go xs []
    where go [] acc = acc
          go (x:xs) acc = go xs (acc ++ x)

-- >>> flatten' [[1,2,3], [4,5,6]]
-- [1,2,3,4,5,6]

flatmap' f xs = go f xs []
    where go _ [] acc = acc
          go f (x:xs) acc = go f xs (acc ++ f x)

-- >>> flatmap' (\x -> [1,x,3]) [2]
-- [1,2,3]

-- >>> flatmap' (\x -> "WO " ++ [x] ++ " HOO ") "123"
-- "WO 1 HOO WO 2 HOO WO 3 HOO "

flatten'' = flatmap' id

-- >>> Data.List.maximumBy compare [] 
-- maximumBy: empty structure

max' cmp  =  fromMaybe (errorWithoutStackTrace "max': empty structure") 
    . go cmp Nothing
    where go _ acc []     = acc
          go _ acc (x:xs) = case acc of
                                Nothing -> go cmp (Just x) xs
                                Just y  -> case cmp x y of
                                                GT -> go cmp (Just x) xs
                                                _  -> go cmp (Just y) xs

max'' cmp [] = error "max'': empty structure"
max'' cmp (x:xs) = go x xs
    where go mx [] = mx
          go mx (y:ys) = go (if cmp mx y == GT then mx else y) ys

-- >>> max' compare [1,2,3]
-- 3

-- >>> max'' compare [1,2,3]
-- 3

-- literally the same but with comparison flipped..
min' cmp = max' (flip cmp)

-- >>> min' compare [1,2,3]
-- 1

-- >>> :t compare
-- compare :: Ord a => a -> a -> Ordering
