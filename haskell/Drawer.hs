module Drawer (makeBattlefield, makeTextScreen) where
import Sprites

-- Full screen builders

-- Receives the battle params and returns the list of strings that will be printed
makeBattlefield:: [String] -> (Int, Int) -> Int -> String -> [Int] -> [Int] -> [String]
makeBattlefield playerColors (playerLife, playerEnergy) bossLife boss playerCards currentCards =
  [cycleChar "░░" 98 ++ "\n"] ++
  makeHealthBarLines [(playerLife, playerEnergy), (bossLife, 100)] (cycleChar "░░" 22) ++
  [cycleChar "░░" 98 ++ "\n"] ++
  makeCharacterLines ["mainCharacter", boss] playerColors (cycleChar "░░" 40) ++
  [cycleChar "░░" 98 ++ "\n"] ++
  ["░░" ++ cycleChar "██" 96 ++ "░░" ++ "\n"] ++
  ["██" ++ cycleChar "░░" 67 ++ "██" ++ (cycleChar "░░" 28) ++ "██" ++ "\n"] ++
  makeCardLines playerCards currentCards (cycleChar "░░" 2) ++
  ["██" ++ cycleChar "░░" 67 ++ "██" ++ (cycleChar "░░" 28) ++ "██" ++ "\n"] ++
  ["░░" ++ cycleChar "██" 96 ++ "░░" ++ "\n"]


-- Battlefield builder utils
makeHealthBarLines:: [(Int, Int)] -> String -> [String]
makeHealthBarLines dataList spacer =
    let sprites = map (\(life, energy) -> getHealthBarSprite life energy) dataList
    in (concatLines (map (\sprite -> lines sprite) sprites) 0 spacer)

makeCharacterLines:: [String] -> [String] -> String -> [String]
makeCharacterLines dataList colorList spacer =
    let sprites = map (\character -> (getCharacterSprite character colorList)) dataList
    in (concatLines (map (\sprite -> lines sprite) sprites) 0 spacer)

makeCardLines:: [Int] -> [Int] -> String -> [String]
makeCardLines playerCards currentCards spacer =
    let sprites = map (\cardNumber -> getCardSprite cardNumber) ([-1] ++ playerCards ++ [-1] ++ currentCards ++ [-1])
    in concatLines (map (\sprite -> lines sprite) sprites) 0 spacer





-- Receives a String, converts it to the respective sprites and builds a screen with it
makeTextScreen:: [String] -> [String]
makeTextScreen texts = 
    [cycleChar "██" 98 ++ "\n"] ++
    getBorderSpacer "░░" ++
    (flatten (map (\text -> makeTextLines ("(" ++ text ++ ")") ++ getBorderSpacer " " ++ getBorderSpacer " ") (makeTextScreenContent texts))) ++
    getBorderSpacer "░░" ++
    getBorderSpacer "░░" ++
    [cycleChar "██" 98 ++ "\n"]


-- Text screen builder utils
getBorderSpacer:: String -> [String]
getBorderSpacer spacer = ["██░░░░" ++ cycleChar spacer 93 ++ "░░██" ++ "\n"]

flatten:: [[a]] -> [a]
flatten [] = []
flatten (h:t) = h ++ flatten t

makeTextLines:: [Char] -> [String]
makeTextLines text =
    let sprites = map (\char -> getCharSprite char) (take 40 (text ++ cycle " "))
    in (concatLines (map (\sprite -> lines sprite) sprites) 0 " ")

makeTextScreenContent :: [String] -> [String]
makeTextScreenContent content = splitLines (handleBreakLines (unlines content) 0) 0

splitLines :: String -> Int -> [String]
splitLines content 9 = []
splitLines content lineNumber =
  let (line, rest) = splitAt 37 content
  in line : splitLines rest (lineNumber + 1)

handleBreakLines:: [Char] -> Int -> String
handleBreakLines [] c = cycle " "
handleBreakLines (char: tail) charCount =
  if (char == '\n') then
    ((take (37 - (charCount `mod` 37))) (cycle " "))  ++ handleBreakLines tail 0
  else
    char : handleBreakLines tail (charCount + 1)





-- Generic utils
cycleChar:: String -> Int -> String
cycleChar char n = take (n*2) (cycle char)

concatLines:: [[String]] -> Int -> String -> [String]
concatLines sprites lineNumber spacer
  | lineNumber < length (sprites !! 0) = [concatLine sprites lineNumber spacer] ++ concatLines sprites (lineNumber+1) spacer
  | otherwise = []

concatLine:: [[String]] -> Int -> String -> String
concatLine (h: []) lineNumber spacer = h !! lineNumber ++ "\n"
concatLine (h: t) lineNumber spacer = h !! lineNumber ++ spacer ++ concatLine t lineNumber spacer