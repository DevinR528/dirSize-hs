module Main where

import Lib
import Data.Monoid
import Data.List
import Data.Functor
import Control.Applicative

first :: String -> [Char]
first (x:xs) = [x]

flatten :: [[a]] -> [a]
flatten [[]] = []
flatten [[a]] = [a]
flatten (x:xs) = x ++ flatten xs

toChars :: String -> String
toChars [] = ""
toChars (x:xs) = [x] ++ ['\r', '\n'] ++ toChars xs

mappy :: IO ()
mappy = do
  line <- getLine
  let c = toChars line
  putStr c

main :: IO ()
main = do
  putStrLn "Name of directory to calculate size: "
  line <- getLine
  directorySize line
