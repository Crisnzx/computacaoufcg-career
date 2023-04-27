module Drawer (makeLines, makeSpaces) where
import Sprites

makeHealthBarLines:: [Int] -> String -> [String]
makeHealthBarLines dataList spacer =
    let sprites = map (\character -> getCharacterSprite character) dataList
    in (concatLines (map (\sprite -> lines sprite) sprites) 0 spacer)

makeCharacterLines:: [String] -> String -> [String]
makeCharacterLines dataList spacer =
    let sprites = map (\character -> getCharacterSprite character) dataList
    in (concatLines (map (\sprite -> lines sprite) sprites) 0 spacer)

makeCharLines:: [Char] -> String -> [String]
makeCharLines dataList spacer =
    let sprites = map (\char -> getCharSprite char) dataList
    in (concatLines (map (\sprite -> lines sprite) sprites) 0 spacer)

makeCardLines:: [Int] -> String -> [String]
makeCardLines dataList spacer =
    let sprites = map (\cardNumber -> getCardSprite cardNumber) dataList
    in concatLines (map (\sprite -> lines sprite) sprites) 0 spacer


makeSpaces:: Int -> String
makeSpaces 0 = ""
makeSpaces n = " " ++ makeSpaces n-1


concatLines:: [[String]] -> Int -> String -> [String]
concatLines sprites lineNumber spacer
  | lineNumber < length (sprites !! 0) = [concatLine sprites lineNumber spacer] ++ concatLines sprites (lineNumber+1) spacer
  | otherwise = []

concatLine:: [[String]] -> Int -> String -> String
concatLine (h: []) lineNumber spacer = h !! lineNumber ++ "\n"
concatLine (h: t) lineNumber spacer = h !! lineNumber ++ spacer ++ concatLine t lineNumber spacer
