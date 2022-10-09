-- 'where' keyword exercises 
mult1 = x * y 
        where x = 5
              y = 6

where1 = x * 3 + y 
         where x = 3 
               y = 1000 

where2 = x * 5 
         where x = 10 * 5 + y 
               y = 10 


-- it feels like there's a very clear order of reduction
where3 = z / x + y 
         where z = y * 10 
               y = negate x 
               x = 7 

-- feels very natural so far when thinking abt it 
-- in mathematical notation context
-- then again there are many implicit assumptions I'm making
-- because of this bias
