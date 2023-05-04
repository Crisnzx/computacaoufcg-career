module Drawer (makeBattlefield, makeText) where
import Sprites

makeHealthBarLines:: [Int] -> String -> [String]
makeHealthBarLines dataList spacer =
    let sprites = map (\lifeNumber -> getHealthBarSprite lifeNumber) dataList
    in (concatLines (map (\sprite -> lines sprite) sprites) 0 spacer)

makeCharacterLines:: [String] -> String -> [String]
makeCharacterLines dataList spacer =
    let sprites = map (\character -> getCharacterSprite character) dataList
    in (concatLines (map (\sprite -> lines sprite) sprites) 0 spacer)

makeText:: [Char] -> [String]
makeText dataList =
    let sprites = map (\char -> getCharSprite char) dataList
    in (concatLines (map (\sprite -> lines sprite) sprites) 0 " ")

makeCardLines:: [Int] -> [Int] -> String -> [String]
makeCardLines playerCards currentCards spacer =
    let sprites = map (\cardNumber -> getCardSprite cardNumber) ([-1] ++ playerCards ++ [-1] ++ currentCards ++ [-1])
    in concatLines (map (\sprite -> lines sprite) sprites) 0 spacer

makeGenericLines:: [String] -> String -> [String]
makeGenericLines sprites spacer = (concatLines (map (\sprite -> lines sprite) sprites) 0 spacer)

cycleChar:: String -> Int -> String
cycleChar char n = take (n*2) (cycle char)

concatLines:: [[String]] -> Int -> String -> [String]
concatLines sprites lineNumber spacer
  | lineNumber < length (sprites !! 0) = [concatLine sprites lineNumber spacer] ++ concatLines sprites (lineNumber+1) spacer
  | otherwise = []

concatLine:: [[String]] -> Int -> String -> String
concatLine (h: []) lineNumber spacer = h !! lineNumber ++ "\n"
concatLine (h: t) lineNumber spacer = h !! lineNumber ++ spacer ++ concatLine t lineNumber spacer





-- receives the battle params and returns the list of strings that will be printed
makeBattlefield:: Int -> Int -> String -> [Int] -> [Int] -> [String]
makeBattlefield playerLife bossLife boss playerCards currentCards =
  [cycleChar "░░" 98 ++ "\n"] ++
  makeHealthBarLines [playerLife, bossLife] (cycleChar "░░" 34) ++
  [cycleChar "░░" 98 ++ "\n"] ++
  makeCharacterLines ["mainCharacter", boss] (cycleChar "░░" 56) ++
  [cycleChar "░░" 98 ++ "\n"] ++
  ["░░" ++ cycleChar "██" 96 ++ "░░" ++ "\n"] ++
  ["██" ++ cycleChar "░░" 67 ++ "██" ++ (cycleChar "░░" 28) ++ "██" ++ "\n"] ++
  makeCardLines playerCards currentCards (cycleChar "░░" 2) ++
  ["██" ++ cycleChar "░░" 67 ++ "██" ++ (cycleChar "░░" 28) ++ "██" ++ "\n"] ++
  ["░░" ++ cycleChar "██" 96 ++ "░░" ++ "\n"]
