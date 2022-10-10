-- all of these functions are unsafe.. 

-- making "hello World" into "ello World"
tailing :: [a] -> [a]
tailing = drop 1
-- >>> tailing "hello world"
-- "ello world"

-- making "Curry is awesome" into "Curry is awesome!"
concatExc :: [Char] -> [Char]
concatExc = (++ "!")
-- concatExc x = x ++ "!" using partial application and eta reduction
-- >>> concatExc "hi"
-- "hi!"

-- making "Curry is awesome!" into "y"
-- >>> (!!) "Curry is awesome!" 4
-- >>> drop 4 $ take 5 "Curry is awesome!"
-- 'y'
-- "y"
yExample :: [a] -> [a]
yExample x = drop 4 $ take 5 x 
-- >>> yExample "curry is awesome"
-- "y"

-- making "Curry is awesome!" into "awesome!"
lastWordExample :: [a] -> [a]
lastWordExample = drop 9 
-- >>> lastWordExample "Curry is awesome!"
-- "awesome!"

-- return third character of string
thirdLetter :: [Char] -> Char 
thirdLetter = (!! 2) -- unsafe
-- >>> thirdLetter "higga"
-- 'g'

-- return letter of string. unsafe for now..  
letterIndex :: Int -> Char
letterIndex x = str !! (x - 1) 
                where str = "Curry is awesome!"
-- >>> letterIndex 5
-- 'y'

-- oh my god
-- reverse "Curry is awesome" to "awesome is Curry"
-- cavemen strat
rvrs :: [Char]
rvrs =  let x = "Curry is awesome"
            firstTwo = take 9 x -- is there a better way to write this.. 
            third    = drop 9 x
            first    = take 5 firstTwo 
            second   = drop 5 firstTwo 
        in third ++ second ++ first 
-- >>> rvrs
-- "awesome is Curry"