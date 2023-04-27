module Drawer (makeLines) where
import Sprites

makeLines:: String -> [Char] -> String -> [String]
makeLines mapper dataList spacer
  -- | mapper == "card" =
  --   let sprites = map (\cardNumber -> getSpriteCard cardNumber) dataList
  --   in concatLines (map (\sprite -> lines sprite) sprites) 0 spacer
  | mapper == "char" =
    let sprites = map (\character -> getSpriteChar character) dataList
    in (concatLines (map (\sprite -> lines sprite) sprites) 0 spacer)

concatLines:: [[String]] -> Int -> String -> [String]
concatLines sprites lineNumber spacer
  | lineNumber < length (sprites !! 0) = [concatLine sprites lineNumber spacer] ++ concatLines sprites (lineNumber+1) spacer
  | otherwise = []

concatLine:: [[String]] -> Int -> String -> String
concatLine (h: []) lineNumber spacer = h !! lineNumber ++ "\n"
concatLine (h: t) lineNumber spacer = h !! lineNumber ++ spacer ++ concatLine t lineNumber spacer
