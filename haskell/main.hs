-- import Menu
-- import Cards

getASCIICard2:: String

getASCIICard1 = "░░one█████████░░\n██░░░░░░░░░░░░██\n██░█▀▀█░░█▀▀█░██\n██░█▄▄█░░█▄▄█░██\n██░▄▄▄█░░▄▄▄█░██\n██░░░░░░░░░░░░██\n██░░░░░░░░░░░░██\n░░████████████░░\n"
getASCIICard2 = "░░two█████████░░\n██░░░░░░░░░░░░██\n██░█▀▀█░░█▀▀█░██\n██░█▄▄█░░█▄▄█░██\n██░▄▄▄█░░▄▄▄█░██\n██░░░░░░░░░░░░██\n██░░░░░░░░░░░░██\n░░████████████░░\n"
getASCIICard3 = "░░thr█████████░░\n██░░░░░░░░░░░░██\n██░█▀▀█░░█▀▀█░██\n██░█▄▄█░░█▄▄█░██\n██░▄▄▄█░░▄▄▄█░██\n██░░░░░░░░░░░░██\n██░░░░░░░░░░░░██\n░░████████████░░\n"
getASCIICard4 = "░░fou█████████░░\n██░░░░░░░░░░░░██\n██░█▀▀█░░█▀▀█░██\n██░█▄▄█░░█▄▄█░██\n██░▄▄▄█░░▄▄▄█░██\n██░░░░░░░░░░░░██\n██░░░░░░░░░░░░██\n░░████████████░░\n"
getASCIICard5 = "░░fiv█████████░░\n██░░░░░░░░░░░░██\n██░█▀▀█░░█▀▀█░██\n██░█▄▄█░░█▄▄█░██\n██░▄▄▄█░░▄▄▄█░██\n██░░░░░░░░░░░░██\n██░░░░░░░░░░░░██\n░░████████████░░\n"
getASCIICard6 = "░░six█████████░░\n██░░░░░░░░░░░░██\n██░█▀▀█░░█▀▀█░██\n██░█▄▄█░░█▄▄█░██\n██░▄▄▄█░░▄▄▄█░██\n██░░░░░░░░░░░░██\n██░░░░░░░░░░░░██\n░░████████████░░\n"
getASCIICard7 = "░░sev█████████░░\n██░░░░░░░░░░░░██\n██░█▀▀█░░█▀▀█░██\n██░█▄▄█░░█▄▄█░██\n██░▄▄▄█░░▄▄▄█░██\n██░░░░░░░░░░░░██\n██░░░░░░░░░░░░██\n░░████████████░░\n"
getASCIICard8 = "░░eig█████████░░\n██░░░░░░░░░░░░██\n██░█▀▀█░░█▀▀█░██\n██░█▄▄█░░█▄▄█░██\n██░▄▄▄█░░▄▄▄█░██\n██░░░░░░░░░░░░██\n██░░░░░░░░░░░░██\n░░████████████░░\n"

mapNumberToAscii:: Int -> String
mapNumberToAscii 1 = getASCIICard1
mapNumberToAscii 2 = getASCIICard2
mapNumberToAscii 3 = getASCIICard3
mapNumberToAscii 4 = getASCIICard4
mapNumberToAscii 5 = getASCIICard5
mapNumberToAscii 6 = getASCIICard6
mapNumberToAscii 7 = getASCIICard7
mapNumberToAscii 8 = getASCIICard8

buildColumns:: [String] -> String -> [String]
buildColumns sprites spacer = concatLines (map (\sprite -> lines sprite) sprites) 0 spacer

concatLines:: [[String]] -> Int -> String -> [String]
concatLines sprites i spacer
  | i < length (sprites !! 0) = [concatLine sprites i spacer] ++ concatLines sprites (i+1) spacer
  | otherwise = []

concatLine:: [[String]] -> Int -> String -> String
concatLine (h: []) lineNumber spacer = h !! lineNumber ++ "\n"
concatLine (h: t) lineNumber spacer = h !! lineNumber ++ spacer ++ concatLine t lineNumber spacer



main:: IO()
main = do
  -- printMenu
  let drawnCards = [5,3,1,8]
  let asciiDrawnCards = map (\cardNumber -> mapNumberToAscii cardNumber) drawnCards
  mapM_ putStr (buildColumns asciiDrawnCards "░░░░░░")
