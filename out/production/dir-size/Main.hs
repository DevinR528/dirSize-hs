module Main where

import Lib
import Data.Monoid
import Data.List
import Data.Functor
import Control.Applicative

main :: IO ()
main = do
  putStr "Name of directory to calculate size: "
  line <- getLine
  directorySize line
