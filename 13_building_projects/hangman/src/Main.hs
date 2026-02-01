module Main (main) where

import Control.Monad (forever) -- [1]
import Data.Char (toLower) -- [2]
import Data.Maybe (isJust) -- [3]
import Data.List (intersperse) -- [4]
import System.Exit (exitSuccess) -- [5]
import System.Random (randomRIO) -- [6]

main :: IO ()
main = do
  word <- randomWord'
  let puzzle = freshPuzzle (fmap toLower word)
  runGame puzzle

type WordList = [String]
allWords :: IO WordList
allWords = do
  dict <- readFile "/home/yu/Projects/Learning/purplebook-exercises/13_building_projects/hangman/data/linux.words"
  return (lines dict)

minWordLength :: Int
minWordLength = 5
maxWordLength :: Int
maxWordLength = 9

gameWords :: IO [[Char]]
gameWords = do
  aw <- allWords
  return (filter gameLength aw)
  where gameLength w =
          let l = length (w :: String)
          in  l > minWordLength && l < maxWordLength

randomWord :: WordList -> IO String
randomWord wl = do
  randomIndex <- randomRIO (0, length wl - 1)
  return $ wl !! randomIndex

randomWord' :: IO String
randomWord' = gameWords >>= randomWord

-- >>> randomWord'
-- "iotize"

data Puzzle = Puzzle String [Maybe Char] [Char]

instance Show Puzzle where
  show (Puzzle _ discovered guessed) = 
    (intersperse ' ' $ fmap renderPuzzleChar discovered)
    ++ " Guessed so far: " ++ guessed

freshPuzzle :: String -> Puzzle
freshPuzzle s = Puzzle s (map (const Nothing) s) []

charInWord :: Puzzle -> Char -> Bool
charInWord (Puzzle s _ _) c = c `elem` s

alreadyGuessed :: Puzzle -> Char -> Bool
alreadyGuessed (Puzzle _ _ guessed) c = c `elem` guessed

renderPuzzleChar :: Maybe Char -> Char
renderPuzzleChar = maybe '_' id

-- >>> renderPuzzleChar Nothing
-- >>> renderPuzzleChar (Just 'c')
-- '_'
-- 'c'

-- >>> fmap renderPuzzleChar [Nothing, Just 'h', Nothing, Just 'e', Nothing]
-- "_h_e_"

-- this is smart lmao
fillInCharacter :: Puzzle -> Char -> Puzzle
fillInCharacter (Puzzle word filledInSoFar s) c =
    Puzzle word newFilledInSoFar (c:s)
    -- zipper partially applies on c
    -- then zips [word] and [filled]
    -- via changing only appearances of c to Just
    -- and leaving the rest untouched
    where zipper guessed wordChar guessChar = 
            if wordChar == guessed
              then Just wordChar
              else guessChar

          newFilledInSoFar = 
            zipWith (zipper c) word filledInSoFar

handleGuess :: Puzzle -> Char -> IO Puzzle
handleGuess puzzle guess = do
  putStrLn $ "Your guess was: " ++ [guess]
  case (charInWord puzzle guess
    , alreadyGuessed puzzle guess) of
    (_, True) -> do
      putStrLn "You already guessed that\
      \ character, pick something else!"
      return puzzle
    (True, _) -> do
      putStrLn "This character was in the word,\
      \ filling in the word accordingly"
      return (fillInCharacter puzzle guess)
    (False, _) -> do
      putStrLn "This character wasn't in\
      \ the word, try again."
      return (fillInCharacter puzzle guess)

gameOver :: Puzzle -> IO ()
gameOver (Puzzle wordToGuess _ guessed) =
  if (length guessed) > 7 then 
      do  putStrLn "You lose!"
          putStrLn $ "The word was: " ++ wordToGuess
          exitSuccess
    else return ()

gameWin :: Puzzle -> IO ()
gameWin (Puzzle _ filledInSoFar _) =
  if all isJust filledInSoFar then
    do  putStrLn "You win!"
        exitSuccess
  else return ()

runGame :: Puzzle -> IO ()
runGame puzzle = forever $ do
  gameWin puzzle
  gameOver puzzle
  putStrLn $ "Current puzzle is: " ++ show puzzle
  putStr "Guess a letter: "
  guess <- getLine
  case guess of
    [c] -> handleGuess puzzle c >>= runGame
    _ -> putStrLn "Your guess must\
        \ be a single character"
