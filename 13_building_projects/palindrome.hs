import Control.Monad
import Data.Char (toLower, isAlphaNum)
import System.Exit (exitSuccess)

isPalindrome :: String -> Bool
isPalindrome s = (s1 == reverse s1)
    where s1 = filter isAlphaNum . fmap toLower $ s

palindrome :: IO ()
palindrome = forever $ do
    line <- getLine
    if isPalindrome line
        then putStrLn "It's a palindrome!"
        else putStrLn "Nope!" >> exitSuccess

main :: IO ()
main = palindrome