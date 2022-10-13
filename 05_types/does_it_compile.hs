-- 1 
bigNum = (^) 5 10 
-- wahoo = bigNum $ 10 
-- remove wahoo i guess. bigNum is already a value 
-- >>> :t bigNum
-- bigNum :: Integer 

-- 2 
x = print 
y = print "woohoo!" 
z = x "hello" 

-- 3 
-- >>> a = (+)
-- >>> b = 5 
-- >>> c = b 10 <----- apply value
-- >>> d = c 200  

-- tried removing b altogether.. 
-- >>> a = (+)
-- >>> c = a 10 
-- >>> d = c 200
-- >>> :t d
-- d :: Num a => a

-- 4 
-- a = 12 + b 
-- b = 1000 * c <---- not in scope
