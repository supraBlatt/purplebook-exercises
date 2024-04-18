{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use intercalate" #-}
module WordNumber where
    import Data.List (intersperse)

    digitToWord :: Int -> String
    digitToWord n = 
        case n of
            1 -> "one"
            2 -> "two"
            3 -> "three"
            4 -> "four"
            5 -> "five"
            6 -> "six"
            7 -> "seven"
            8 -> "eight"
            9 -> "nine"
            _ -> ""

    digits :: Int -> [Int]
    digits = map (read . (:[])) . show
    
    -- >>> digits 0
    -- [0]

    wordNumber :: Int -> String
    wordNumber = 
        concat 
        . intersperse "-" 
        . map digitToWord 
        . digits 


    wordNumber' :: [Int] -> String
    wordNumber' = concat 
                . intersperse "-" 
                . map digitToWord
-- >>> wordNumber' [6,5, 8, 90, 95]
-- "six-five-eight--"
