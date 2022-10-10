module Reverse where 

rvrs:: String -> String 
rvrs x =    third ++ second ++ first  
            where   firstTwo = take 9 x 
                    third    = drop 9 x
                    first    = take 5 firstTwo 
                    second   = drop 5 firstTwo 


main :: IO ()
main = print $ rvrs "Curry is awesome"
