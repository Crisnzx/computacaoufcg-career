module Drawer (makeBattlefield, makeTextScreen) where
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
makeText text =
    let sprites = map (\char -> getCharSprite char) (take 40 (text ++ cycle " "))
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
  makeHealthBarLines [playerLife, bossLife] (cycleChar "░░" 22) ++
  [cycleChar "░░" 98 ++ "\n"] ++
  makeCharacterLines ["mainCharacter", boss] (cycleChar "░░" 40) ++
  [cycleChar "░░" 98 ++ "\n"] ++
  ["░░" ++ cycleChar "██" 96 ++ "░░" ++ "\n"] ++
  ["██" ++ cycleChar "░░" 67 ++ "██" ++ (cycleChar "░░" 28) ++ "██" ++ "\n"] ++
  makeCardLines playerCards currentCards (cycleChar "░░" 2) ++
  ["██" ++ cycleChar "░░" 67 ++ "██" ++ (cycleChar "░░" 28) ++ "██" ++ "\n"] ++
  ["░░" ++ cycleChar "██" 96 ++ "░░" ++ "\n"]

makeTextScreen:: [String] -> [String]
makeTextScreen texts = 
    [cycleChar "██" 98 ++ "\n"] ++
    getBorderSpacer "░░" ++
    (flatten (map (\text -> makeText ("(" ++ text ++ ")") ++ getBorderSpacer " " ++ getBorderSpacer " ") (makeTextScreenContent texts))) ++
    getBorderSpacer "░░" ++
    getBorderSpacer "░░" ++
    [cycleChar "██" 98 ++ "\n"]

getBorderSpacer:: String -> [String]
getBorderSpacer spacer = ["██░░░░" ++ cycleChar spacer 93 ++ "░░██" ++ "\n"]

flatten:: [[a]] -> [a]
flatten [] = []
flatten (x:xs) = x ++ flatten xs

makeTextScreenContent :: [String] -> [String]
makeTextScreenContent content = splitLines (handleBreakLines (unlines content) 0) 0

handleBreakLines:: [Char] -> Int -> String
handleBreakLines [] c = cycle " "
handleBreakLines (char: tail) charCount =
  if (char == '\n') then
    ((take (37 - (charCount `mod` 37))) (cycle " "))  ++ handleBreakLines tail 0
  else
    char : handleBreakLines tail (charCount + 1)

-- splitLines :: String -> Int -> [String]
-- splitLines content = [ take 37 content ] ++ splitLines (drop 37 content)

splitLines :: String -> Int -> [String]
splitLines content 9 = []
splitLines content lineNumber =
  let (line, rest) = splitAt 37 content
  in line : splitLines rest (lineNumber + 1)