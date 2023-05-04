module Helpers (isEven, isOdd) where

isEven:: Int -> Bool
isEven x = x `mod` 2 == 0

isOdd:: Int -> Bool
isOdd x = x `mod` 2 == 1
