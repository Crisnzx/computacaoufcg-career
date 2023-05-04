module Drawer (makeHealthBarLines, makeCharacterLines, makeTextLines, makeCardLines, makeSpaces) where
import Sprites

makeHealthBarLines:: [Int] -> String -> [String]
makeHealthBarLines dataList spacer =
    let sprites = map (\lifeNumber -> getHealthBarSprite lifeNumber) dataList
    in (concatLines (map (\sprite -> lines sprite) sprites) 0 spacer)

makeCharacterLines:: [String] -> String -> [String]
makeCharacterLines dataList spacer =
    let sprites = map (\character -> getCharacterSprite character) dataList
    in (concatLines (map (\sprite -> lines sprite) sprites) 0 spacer)

makeTextLines:: [Char] -> String -> [String]
makeTextLines dataList spacer =
    let sprites = map (\char -> getCharSprite char) dataList
    in (concatLines (map (\sprite -> lines sprite) sprites) 0 spacer)

makeCardLines:: [Int] -> String -> [String]
makeCardLines dataList spacer =
    let sprites = map (\cardNumber -> getCardSprite cardNumber) dataList
    in concatLines (map (\sprite -> lines sprite) sprites) 0 spacer

makeGenericLines:: [String] -> String -> [String]
makeGenericLines sprites spacer = (concatLines (map (\sprite -> lines sprite) sprites) 0 spacer)


makeSpaces:: Int -> String
makeSpaces 0 = ""
makeSpaces n = " " ++ makeSpaces (n-1)


concatLines:: [[String]] -> Int -> String -> [String]
concatLines sprites lineNumber spacer
  | lineNumber < length (sprites !! 0) = [concatLine sprites lineNumber spacer] ++ concatLines sprites (lineNumber+1) spacer
  | otherwise = []

concatLine:: [[String]] -> Int -> String -> String
concatLine (h: []) lineNumber spacer = h !! lineNumber ++ "\n"
concatLine (h: t) lineNumber spacer = h !! lineNumber ++ spacer ++ concatLine t lineNumber spacer





-- receives the battle params and returns the list of strings that will be printed
-- makeBattlefield:: [Int] -> String -> Int -> Int -> [String]
-- makeBattlefield cards boss playerLife bossLife = do
--     let cardLines = makeCardLines cards (makeSpaces 2)
--     let 