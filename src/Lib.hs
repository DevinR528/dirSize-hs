module Lib
    ( directorySize
    ) where
import System.Directory

directorySize :: String -> IO ()
directorySize folder = do
  paths <- listDirectory folder
  sizes <- mapM getFileSize paths
  let count = sum sizes
  print count