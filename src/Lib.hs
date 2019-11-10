module Lib
    ( directorySize
    ) where
import System.Directory

flatten :: [[a]] -> [a]
flatten [[]] = []
flatten [[a]] = [a]
flatten (x:xs) = x ++ flatten xs

folderOrFile :: FilePath -> IO [FilePath]
folderOrFile path = do
  isFile <- doesFileExist path
  if isFile
    then return [path]
    else do
      isFolder <- doesDirectoryExist path
      if isFolder
        then do
          xs <- listDirectory path
          nested <- mapM folderOrFile xs
          return (flatten nested)
        else
          return []

directorySize :: String -> IO ()
directorySize folder = do
  paths <- listDirectory folder
  x <- mapM folderOrFile paths
  sizes <- mapM getFileSize (flatten x)
  let count = sum sizes
  print count