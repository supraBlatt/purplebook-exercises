-- 1 
-- the type of [[True, False], [True, True], [False, True]]

-- >>> :t [[True, False], [True, True], [False, True]]
-- [[True, False], [True, True], [False, True]] :: [[Bool]]

-- 2
-- >>> :t [[3 == 3], [6 > 5], [3 < 4]]
-- [[3 == 3], [6 > 5], [3 < 4]] :: [[Bool]]

-- 3
-- same type, both lists (d. all of the above)
func x y = x ++ y

-- 4
-- >>> :t func "Hello world"
-- func "Hello world" :: [Char] -> [Char]

-- >>>  func "Hello" "World"
-- "HelloWorld"

-- >>> func [1, 2, 3] "a, b, c"
-- No instance for (Num Char) arising from the literal `1'
-- In the expression: 1
-- In the first argument of `func', namely `[1, 2, 3]'
-- In the expression: func [1, 2, 3] "a, b, c"

-- >>> :t func ["Hello", "World"]
-- func ["Hello", "World"] :: [String] -> [String]

-- technically all but the third one are valid applications
-- it's just that func "Hellow" "World" reduces to a value

