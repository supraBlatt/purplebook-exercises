greetIfCool :: [Char] -> IO ()
greetIfCool coolness = if cool then putStrLn x else putStrLn y 
                       where x      = "eyyyy. What's shakin'?"
                             y      = "pshhhhhhh"
                             frost  = "downright frosty yo"
                             cool   = coolness == frost 

-- oh no IO monad moment again
-- >>> greetIfCool "hi"

