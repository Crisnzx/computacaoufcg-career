module Cards (getASCIICard2, mapNumberToASCII) where

getASCIICard2:: String

getASCIICard2 = "░░████████████░░\n██░░░░░░░░░░░░██\n██░█▀▀█░░█▀▀█░██\n██░█▄▄█░░█▄▄█░██\n██░▄▄▄█░░▄▄▄█░██\n██░░░░░░░░░░░░██\n██░░░░░░░░░░░░██\n░░████████████░░\n"

mapNumberToASCII:: Int -> String
mapNumberToASCII 2 = getASCIICard2
mapNumberToASCII 3 = getASCIICard2
mapNumberToASCII 4 = getASCIICard2
mapNumberToASCII 5 = getASCIICard2
mapNumberToASCII 6 = getASCIICard2
