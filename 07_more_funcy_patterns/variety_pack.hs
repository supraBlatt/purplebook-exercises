k :: (a, b) -> a
k (x, y) = x
-- 
k1 = k (1, 10)
k2 = k ("three", 1)
k3 = k(3, "True")
-- 

f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (a, _, c) (d, _, f) = ((a, d), (c, f))