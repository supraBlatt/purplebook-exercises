-- type tests
-- >>> :t "hi"
-- "hi" :: [Char]

a = print "big pp"
b = putStrLn "aaaaaaaaaaaaaaaaaa"
-- >>> "urmomgae"
-- "urmomgae"

-- >>> :t print
-- print :: Show a => a -> IO ()

-- >>> :t putStrLn
-- putStrLn :: String -> IO ()

-- >>> :t putStrLn "big pp"
-- putStrLn "big pp" :: IO ()

-- >>> :t print "big pp"
-- print "big pp" :: IO ()

-- so.. apparently that's IO generating a unit type
-- or something along these lines, while sending its
-- effect to stdout? so evaluation leads to () which is 
-- not shown using the lens big fat rip. 
-- >>> print "hello world!"
