module Print3 where

myGreeting = "hello" ++ " world!"
hello = "hello"
world = "world!"

main = do 
       putStrLn myGreeting
       putStrLn secondGreeting
       where secondGreeting = concat [hello, " ", world]