module Drawer (buildLine) where

buildLine:: [String] -> [String]
buildLine sprites = concatLines (map (\sprite -> lines sprite) sprites)

concatLines:: [[String]] -> Int -> [String]
concatLines sprites i = 
  | i < length (concatLine sprites i ++ concatLines sprites i+1) = concatLine sprites i ++ concatLines sprites i+1
  | otherwise = []

concatLine:: [[String]] -> [String]
concatLine [] i = "\n"
concatLine (h: t) lineNumber = h !! lineNumber ++ concatLine t


