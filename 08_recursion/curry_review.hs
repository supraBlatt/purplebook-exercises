cattyConny x y = x ++ " mrow " ++ y 
flippy = flip cattyConny 

appedCatty = cattyConny "woops"
frappe = flippy "haha"

-- >>> appedCatty "woohoo!"
-- "woops mrow woohoo!"
-- >>> frappe "1"
-- "1 mrow haha"
-- >>> frappe (appedCatty "2")
-- "woops mrow 2 mrow haha"
-- >>> cattyConny (frappe "pink") (cattyConny "green" (appedCatty "blue"))
-- "pink mrow haha mrow green mrow woops mrow blue"

{- start the eval chain

 -> cattyConny (frappe "pink") 
 -> (\y. (frappe "pink") ++ " mrow " + y)(catty...)
 -> (frappe "pink") ++ " mrow " ++ (cattyConny "green" (appedCatty "blue")) 
 -> (flippy "haha" "pink") + " mrow " ++ ("green" + " mrow " + (appedCatty "blue")) 
 -> "pink" ++ " mrow " ++ " haha" ++ " mrow " ++ "green" ++ " mrow " ++ "woops" + " mrow " + "blue" 
 -> "pink mrow haha mrow green mrow woops mrow blue"
-}