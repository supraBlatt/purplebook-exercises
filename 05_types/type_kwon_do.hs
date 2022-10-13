-- 1 
f :: Int -> [Char] 
f = undefined 

g :: [Char] -> char 
g = undefined 

h :: Int -> Char 
h x = g $ f x

-- 2 
data A 
data B 
data C 

q :: A -> B 
q = undefined 

w :: B -> C 
w = undefined 

e :: A -> C 
e x = w $ q x -- pretty much the same f.g composition

-- 3 
data X 
data Y 
data Z 

xz :: X -> Z 
xz = undefined 

yz :: Y -> Z 
yz = undefined 

xform :: (X, Y) -> (Z, Z)
xform (x, y) = (xz x, yz y) 

-- 4 
-- one option for implementation ig 
munge :: (x -> y) -> (y -> (w, z)) -> x -> w 
-- dollar is pretty nice for composition ngl
munge xy ywz x =  fst $ ywz $ xy x 