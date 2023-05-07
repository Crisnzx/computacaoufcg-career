module Sprites (getHealthBarSprite, getCharacterSprite, getCardSprite, getCharSprite, paintSpritePixels) where

getHealthBarSprite:: Int -> Int -> String
getHealthBarSprite life energy = unlines (
  makeHealthBarValue life
  ++ ["░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"]
  ++ makeHealthBarMeter life energy
  )

makeHealthBarValue:: Int -> [String]
makeHealthBarValue life = makeTextLines ("########" ++ (padStart life) ++ "##") "░░"

padStart:: Int -> String
padStart life = drop (length (prepareLifeValue life) - 3) (prepareLifeValue life)

prepareLifeValue:: Int -> String
prepareLifeValue life = "##" ++ show life

makeHealthBarMeter:: Int -> Int -> [String]
makeHealthBarMeter life energy = [
  "░░░░░░░░████████████████████████████████████████████████████████████░░░░░░░░",
  "░░░░░░██" ++ fillHealthBar (getHealthBarColor life) (round ((fromIntegral life) * 0.3)) ++  "██░░░░░░",
  "░░░░░░██████████████████████████████████████████████████████████████░░░░░░░░",
  "░░░░░░██" ++ fillEnergyBar (round ((fromIntegral energy) * 0.2)) ++ "██░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░████████████████████████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
  ]

fillHealthBar:: String -> Int -> String
fillHealthBar color lifePixels = paintString color (take (lifePixels*2) (cycle "▓▓")) ++ (take ((30-lifePixels)*2) (cycle "░░"))

getHealthBarColor :: Int -> String
getHealthBarColor life
  | life > 50 = "green"
  | life > 25 = "yellow"
  | otherwise = "red" 

fillEnergyBar:: Int -> String
fillEnergyBar energy = paintString "blue" (take (energy*2) (cycle "▓▓")) ++ (take ((20-energy)*2) (cycle "░░"))

sourceColorChars = ['▓', 's', 't', 'p', 'b']
paintCharacter :: String -> [String] -> Int -> String
paintCharacter characterSprite (head : tail) 4 = paintSpritePixels (paintSpritePixels characterSprite head (sourceColorChars !! 4)) "white" '▒'
paintCharacter characterSprite (head : tail) charIndex = paintCharacter (paintSpritePixels characterSprite head (sourceColorChars !! charIndex)) tail (charIndex + 1)

paintSpritePixels :: [Char] -> String -> Char -> String
paintSpritePixels [] color char = ""
paintSpritePixels (head : tail) color char =
    if head == char then (paintString color ['▓']) ++ (paintSpritePixels tail color char) else head : (paintSpritePixels tail color char)

paintString :: String -> String -> String
paintString color content = getColorPrefix color ++ content ++ getColorPrefix "default"

getColorPrefix :: String -> String
getColorPrefix "black" = "\ESC[30m"
getColorPrefix "red" = "\ESC[31m"
getColorPrefix "green" = "\ESC[32m"
getColorPrefix "yellow" = "\ESC[33m"
getColorPrefix "blue" = "\ESC[34m"
getColorPrefix "magenta" = "\ESC[35m"
getColorPrefix "cyan" = "\ESC[36m"
getColorPrefix "white" = "\ESC[37m"
getColorPrefix "gray" = "\ESC[90m"
getColorPrefix "lightred" = "\ESC[91m"
getColorPrefix "lightgreen" = "\ESC[92m"
getColorPrefix "lightyellow" = "\ESC[93m"
getColorPrefix "lightblue" = "\ESC[94m"
getColorPrefix "lightmagenta" = "\ESC[95m"
getColorPrefix "lightcyan" = "\ESC[96m"
getColorPrefix "lightgray" = "\ESC[97m"
getColorPrefix _ = "\ESC[0m"

-- [hair, skin, tshirt, pants, boots]

getCharacterSprite:: String -> [String] -> String
getCharacterSprite "mainCharacter" colorList = paintCharacter (unlines [
  "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓░░▓▓▓▓▓▓▓▓░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓ssss▓▓ssssssss▓▓▓▓ss██░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓ssss▓▓ss▒▒▒▒▒▒ss▒▒▒▒██░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░░░░░██ssssss▒▒▒▒████ss██▒▒██░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░░░░░░░██ssss▒▒▒▒████ss██▒▒██░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░░░░░████ssssss▒▒▒▒▒▒ss▒▒▒▒██░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░████tttt██ssss████████ss██████░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░██tttttttttt██ssssssssss██tttttt██░░░░",
  "░░░░░░░░░░░░░░░░░░░░██tttttttttttt██████████tttttttt██░░░░",
  "░░░░░░░░░░░░░░░░░░██ss██tttt██tttttttttttttt██tttt██ss██░░",
  "░░░░░░░░░░░░░░░░░░██ssss██████tttttttttttttt██████ssss██░░",
  "░░░░░░░░░░░░░░░░░░██ssssss████tttttttttttttt████ssssss██░░",
  "░░░░░░░░░░░░░░░░░░██ssssss████tttttttttttttt████ssssss██░░",
  "░░░░░░░░░░░░░░░░░░░░██████░░██████████████████░░██████░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░░░░░██pppppppppppppppppp██░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░░░██pppppppppp██pppppppppp██░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░██████pppp████░░████pppp██████░░░░░░",
  "░░░░░░░░░░░░░░░░░░████bbbbbb██████░░░░░░██████bbbbbb████░░",
  "░░░░░░░░░░░░░░░░██bbbbbbbbbbbbbb██░░░░░░██bbbbbbbbbbbbbb██",
  "░░░░░░░░░░░░░░░░██████████████████░░░░░░██████████████████"
  ]) colorList 0

getCharacterSprite "admBoss" _ = paintCharacter (unlines [
  "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░▓▓▓▓▓▓▓ssss▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░▓▓▓▓▓▓ss▒▒▒▒▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░▓▓▓▓ppsspppp▒▒▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██▒▒ppsspppp▒▒▒▒ss▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██▒▒▒▒ss▒▒▒▒▒▒ssssss████░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░██████ss████████ssss██tttt████░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░██ttpptt██ssssssssss██ttttpptttt██░░░░░░░░░░░░░░░░░░░░",
  "░░░░██ttttpptt██████████ttttpptttttt██░░░░░░░░░░░░░░░░░░░░",
  "░░██ss██tttt██pppppppppppppp██tttt██ss██░░░░░░░░░░░░░░░░░░",
  "░░██ssss██████tttttttttttttt██████ssss██░░░░░░░░░░░░░░░░░░",
  "░░██ssssss████pppppppppppppp████ssssss██░░░░░░░░░░░░░░░░░░",
  "░░██ssssss████tttttttttttttt████ssssss██░░░░░░░░░░░░░░░░░░",
  "░░░░██████░░██████████████████░░██████░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░██pppppppppppppppppp██░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██pppppppppp██pppppppppp██░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░██████████████░░██████████████░░░░░░░░░░░░░░░░░░░░░░",
  "░░████bbbbbbbbbb██░░░░░░██bbbbbbbbbb████░░░░░░░░░░░░░░░░░░",
  "██bbbbbbbbbbbbbb██░░░░░░██bbbbbbbbbbbbbb██░░░░░░░░░░░░░░░░",
  "██████████████████░░░░░░██████████████████░░░░░░░░░░░░░░░░"
  ]) ["gray", "lightyellow", "white", "blue", "gray"] 0

getCharacterSprite "p1Boss" _ = paintCharacter (unlines [
  "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░██████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░██████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░████ssssssssss████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██▓▓▓▓ss▓▓▓▓▓▓ssss████░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██▓▓██▓▓████▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██▓▓██▓▓████▓▓ssssss▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██▓▓▓▓ss▓▓▓▓▓▓ssssss████░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░██████ss████████ssss██tttt████░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░██tttttt██ssssssssss██tttttttttt██░░░░░░░░░░░░░░░░░░░░",
  "░░░░██tttttttt██████████tttttttttttt██░░░░░░░░░░░░░░░░░░░░",
  "░░██ss██tttt██tttttttttttttt██tttt██ss██░░░░░░░░░░░░░░░░░░",
  "░░██ssss██████tttttttttttttt██████ssss██░░░░░░░░░░░░░░░░░░",
  "░░██ssssss████tttttttttttttt████ssssss██░░░░░░░░░░░░░░░░░░",
  "░░██ssssss████tttttttttttttt████ssssss██░░░░░░░░░░░░░░░░░░",
  "░░░░██████░░██████████████████░░██████░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░██pppppppppppppppppp██░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██pppppppppp██pppppppppp██░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░██████████████░░██████████████░░░░░░░░░░░░░░░░░░░░░░",
  "░░████bbbbbbbbbb██░░░░░░██bbbbbbbbbb████░░░░░░░░░░░░░░░░░░",
  "██bbbbbbbbbbbbbb██░░░░░░██bbbbbbbbbbbbbb██░░░░░░░░░░░░░░░░",
  "██████████████████░░░░░░██████████████████░░░░░░░░░░░░░░░░"
  ]) ["default", "lightgray", "gray", "default", "gray"] 0
-- ['▓', 's', 't', 'p', 'b']
-- "black"
-- "red"
-- "green"
-- "yellow"
-- "blue"
-- "magenta"
-- "cyan"
-- "white"
-- "gray"
-- "lightred"
-- "lightgreen"
-- "lightyellow"
-- "lightblue"
-- "lightmagenta"
-- "lightcyan"
-- "lightgray"

getCharacterSprite "p2Boss" _ = paintCharacter (unlines [
  "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓░░▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░▓▓▓▓ssssssssss▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░▓▓▒▒▒▒ss▒▒▒▒ssssss▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░▓▓▒▒██ss████▒▒ssss▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██▒▒██ss████▒▒sspp▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██▒▒▒▒ss▒▒▒▒sspppppp████░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░██████pp████████pppp██tttt████░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░██tttttt██pppppppppp██tttttttttt██░░░░░░░░░░░░░░░░░░░░",
  "░░░░██tttttttt██████████tttttttttttt██░░░░░░░░░░░░░░░░░░░░",
  "░░██ss██tttt██tttttttttttttt██tttt██ss██░░░░░░░░░░░░░░░░░░",
  "░░██ssss██████tttttttttttttt██████ssss██░░░░░░░░░░░░░░░░░░",
  "░░██ssssss████tttttttttttttt████ssssss██░░░░░░░░░░░░░░░░░░",
  "░░██ssssss████tttttttttttttt████ssssss██░░░░░░░░░░░░░░░░░░",
  "░░░░██████░░██████████████████░░██████░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░██pppppppppppppppppp██░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██pppppppppp██pppppppppp██░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░██████████████░░██████████████░░░░░░░░░░░░░░░░░░░░░░",
  "░░████bbbbbbbbbb██░░░░░░██bbbbbbbbbb████░░░░░░░░░░░░░░░░░░",
  "██bbbbbbbbbbbbbb██░░░░░░██bbbbbbbbbbbbbb██░░░░░░░░░░░░░░░░",
  "██████████████████░░░░░░██████████████████░░░░░░░░░░░░░░░░"
  ]) ["gray", "lightyellow", "white", "black", "green"] 0

getCharacterSprite "edaBoss" _ = paintCharacter (unlines [
  "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░██████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░██████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░████████ssssss████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░████ssssssssssssss████░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██ssssssssssssssss████░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██▓▓▓▓ss▓▓▓▓▓▓ssssss██░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██▓▓██▓▓████▓▓▓▓▓▓▓▓██░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██▓▓██▓▓████▓▓ssssbb▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██▓▓▓▓ss▓▓▓▓▓▓ssbbbb████░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░██████bb████████bbbb██tttt████░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░██tttttt██bbbbbbbbbb██tttttttttt██░░░░░░░░░░░░░░░░░░░░",
  "░░░░██tttttttt██████████tttttttttttt██░░░░░░░░░░░░░░░░░░░░",
  "░░██ss██tttt██tttttttttttttt██tttt██ss██░░░░░░░░░░░░░░░░░░",
  "░░██ssss██████tttttttttttttt██████ssss██░░░░░░░░░░░░░░░░░░",
  "░░██ssssss████tttttttttttttt████ssssss██░░░░░░░░░░░░░░░░░░",
  "░░██ssssss████tttttttttttttt████ssssss██░░░░░░░░░░░░░░░░░░",
  "░░░░██████░░██████████████████░░██████░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░██pppppppppppppppppp██░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██pppppppppp██pppppppppp██░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░██████████████░░██████████████░░░░░░░░░░░░░░░░░░░░░░",
  "░░████bbbbbbbbbb██░░░░░░██bbbbbbbbbb████░░░░░░░░░░░░░░░░░░",
  "██bbbbbbbbbbbbbb██░░░░░░██bbbbbbbbbbbbbb██░░░░░░░░░░░░░░░░",
  "██████████████████░░░░░░██████████████████░░░░░░░░░░░░░░░░"
  ]) ["default", "lightyellow", "lightmagenta", "magenta", "gray"] 0

getCharacterSprite "plpBoss" _ = paintCharacter (unlines [
  "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░▓▓▓▓░░▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░▓▓ssssssssssssssss▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██▒▒▒▒ss▒▒▒▒▒▒ssssss▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██▒▒██ss████▒▒▒▒ssss▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██▒▒██ss████▒▒▒▒ssss██░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██▒▒▒▒ss▒▒▒▒▒▒ssssss████░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░██████ss████████ssss██tttt████░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░██tttttt██ssssssssss██tttttttttt██░░░░░░░░░░░░░░░░░░░░",
  "░░░░██tttttttt██████████tttttttttttt██░░░░░░░░░░░░░░░░░░░░",
  "░░██ss██tttt██tttttttttttttt██tttt██ss██░░░░░░░░░░░░░░░░░░",
  "░░██ssss██████tttttttttttttt██████ssss██░░░░░░░░░░░░░░░░░░",
  "░░██ssssss████tttttttttttttt████ssssss██░░░░░░░░░░░░░░░░░░",
  "░░██ssssss████tttttttttttttt████ssssss██░░░░░░░░░░░░░░░░░░",
  "░░░░██████░░██████████████████░░██████░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░██pppppppppppppppppp██░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░██pppppppppp██pppppppppp██░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░██████████████░░██████████████░░░░░░░░░░░░░░░░░░░░░░",
  "░░████bbbbbbbbbb██░░░░░░██bbbbbbbbbb████░░░░░░░░░░░░░░░░░░",
  "██bbbbbbbbbbbbbb██░░░░░░██bbbbbbbbbbbbbb██░░░░░░░░░░░░░░░░",
  "██████████████████░░░░░░██████████████████░░░░░░░░░░░░░░░░"
  ]) ["default", "lightyellow", "white", "blue", "cyan"] 0

-- [hair, skin, tshirt, pants, boots]

-- skin
-- t-shirt
-- boot
-- hair
-- pants
-- eyes

getCardSprite:: Int -> String
getCardSprite (-1) = unlines [
  "██",
  "██",
  "██",
  "██",
  "██",
  "██",
  "██",
  "██",
  "██",
  "██",
  "██",
  "██"
  ]

getCardSprite 0 = unlines [
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░"
    ]
getCardSprite 1 = unlines [
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░█▀▀█░░░░░░░░░░░░██",
  "██░░█■■█░░░░░░░░░░░░██",
  "██░░█  █░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ]
getCardSprite 2 = unlines [
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░▀▀▀█░░░░░░░░░░░░██",
  "██░░█▀▀▀░░░░░░░░░░░░██",
  "██░░█▄▄▄░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ]
getCardSprite 3 = unlines [
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░▀▀▀█░░░░░░░░░░░░██",
  "██░░■■■█░░░░░░░░░░░░██",
  "██░░▄▄▄█░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ]
getCardSprite 4 = unlines [
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░█  █░░░░░░░░░░░░██",
  "██░░█▄▄█░░░░░░░░░░░░██",
  "██░░   █░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ]
getCardSprite 5 = unlines [
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░█▀▀▀░░░░░░░░░░░░██",
  "██░░▀▀▀█░░░░░░░░░░░░██",
  "██░░▄▄▄█░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ]
getCardSprite 6 = unlines [
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░█▀▀▀░░░░░░░░░░░░██",
  "██░░█▀▀█░░░░░░░░░░░░██",
  "██░░█▄▄█░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ]
getCardSprite 7 = unlines [
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░▀▀▀█░░░░░░░░░░░░██",
  "██░░   █░░░░░░░░░░░░██",
  "██░░   █░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ]
getCardSprite 8 = unlines [
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░█▀▀█░░░░░░░░░░░░██",
  "██░░█■■█░░░░░░░░░░░░██",
  "██░░█▄▄█░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ]
getCardSprite 9 = unlines [
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░█▀▀█░░░░░░░░░░░░██",
  "██░░█▄▄█░░░░░░░░░░░░██",
  "██░░▄▄▄█░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ]
getCardSprite 10 = unlines [
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░█░█▀▀█░░░░░░░░░░██",
  "██░░█░█  █░░░░░░░░░░██",
  "██░░█░█▄▄█░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ]
getCardSprite 11 = unlines [
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░   █░░░░░░░░░░░░██",
  "██░░   █░░░░░░░░░░░░██",
  "██░░█▄▄█░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ]
getCardSprite 12 = unlines [
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░█▀▀█░░░░░░░░░░░░██",
  "██░░█▄▄█░░░░░░░░░░░░██",
  "██░░   █░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ]
getCardSprite 13 = unlines [
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░█ ▄▀░░░░░░░░░░░░██",
  "██░░██  ░░░░░░░░░░░░██",
  "██░░█ ▀▄░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ]

getCharSprite:: Char -> String
getCharSprite 'a' = unlines [
  "█▀▀█",
  "█■■█",
  "█  █"
  ]
getCharSprite 'b' = unlines [
  "█▀▀▄",
  "█■■█",
  "█▄▄▀"
  ]
getCharSprite 'c' = unlines [
  "█▀▀█",
  "█   ",
  "█▄▄█"
  ]
getCharSprite 'd' = unlines [
  "█▀▀▄",
  "█  █",
  "█▄▄▀"
  ]
getCharSprite 'e' = unlines [
  "█▀▀▀",
  "█■■■",
  "█▄▄▄"
  ]
getCharSprite 'f' = unlines [
  "█▀▀▀",
  "█■■■",
  "█   "
  ]
getCharSprite 'g' = unlines [
  "█▀▀▀",
  "█ ▀█",
  "█▄▄█"
  ]
getCharSprite 'h' = unlines [
  "█  █",
  "█■■█",
  "█  █"
  ]
getCharSprite 'i' = unlines [
  " ▐▌ ",
  " ▐▌ ",
  " ▐▌ "
  ]
getCharSprite 'j' = unlines [
  "   █",
  "   █",
  "█▄▄█"
  ]
getCharSprite 'k' = unlines [
  "█ ▄▀",
  "██  ",
  "█ ▀▄"
  ]
getCharSprite 'l' = unlines [
  "█   ",
  "█   ",
  "█▄▄▄"
  ]
getCharSprite 'm' = unlines [
  "█▄▄█",
  "█▐▌█",
  "█  █"
  ]
getCharSprite 'n' = unlines [
  "█▄ █",
  "█ ▀█",
  "█  █"
  ]
getCharSprite 'o' = unlines [
  "█▀▀█",
  "█  █",
  "█▄▄█"
  ]
getCharSprite 'p' = unlines [
  "█▀▀█",
  "█▄▄█",
  "█   "
  ]
getCharSprite 'q' = unlines [
  "█▀▀█",
  "█▄▄█",
  "   █"
  ]
getCharSprite 'r' = unlines [
  "█▀▀█",
  "█▄▄▀",
  "█ ▀▄"
  ]
getCharSprite 's' = unlines [
  "▄▀▀▀",
  " ▀▀▄",
  "▄▄▄▀"
  ]
getCharSprite 't' = unlines [
  "▀▐▌▀",
  " ▐▌ ",
  " ▐▌ "
  ]
getCharSprite 'u' = unlines [
  "█  █",
  "█  █",
  "█▄▄█"
  ]
getCharSprite 'v' = unlines [
  "█  █",
  "█  █",
  "▀▄▄▀"
  ]
getCharSprite 'w' = unlines [
  "█  █",
  "█▐▌█",
  "█▀▀█"
  ]
getCharSprite 'x' = unlines [
  "▀▄▄▀",
  " ▐▌ ",
  "▄▀▀▄"
  ]
getCharSprite 'y' = unlines [
  "▀▄ █",
  "  ▀█",
  "   █"
  ]
getCharSprite 'z' = unlines [
  "▀▀▀█",
  " ▄▀ ",
  "█▄▄▄"
  ]
getCharSprite '0' = unlines [
  "█▀▀█",
  "█  █",
  "█▄▄█"
  ]
getCharSprite '1' = unlines [
  "   █",
  "   █",
  "   █"
  ]
getCharSprite '2' = unlines [
  "▀▀▀█",
  "█▀▀▀",
  "█▄▄▄"
  ]
getCharSprite '3' = unlines [
  "▀▀▀█",
  "■■■█",
  "▄▄▄█"
  ]
getCharSprite '4' = unlines [
  "█  █",
  "█▄▄█",
  "   █"
  ]
getCharSprite '5' = unlines [
  "█▀▀▀",
  "▀▀▀█",
  "▄▄▄█"
  ]
getCharSprite '6' = unlines [
  "█▀▀▀",
  "█▀▀█",
  "█▄▄█"
  ]
getCharSprite '7' = unlines [
  "▀▀▀█",
  "   █",
  "   █"
  ]
getCharSprite '8' = unlines [
  "█▀▀█",
  "█■■█",
  "█▄▄█"
  ]
getCharSprite '9' = unlines [
  "█▀▀█",
  "█▄▄█",
  "▄▄▄█"
  ]
getCharSprite ' ' = unlines [
  "    ",
  "    ",
  "    "
  ]
getCharSprite '-' = unlines [
  "    ",
  " ■■ ",
  "    "
  ]
getCharSprite '.' = unlines [
  "    ",
  "    ",
  " ▄  "
  ]

getCharSprite ',' = unlines [
  "    ",
  "    ",
  "▄▀  "
  ]

getCharSprite '!' = unlines [
  " █  ",
  " █  ",
  " ▄  "
  ]
getCharSprite '?' = unlines [
  "▀▀▀█",
  " █▀▀",
  " ▄  "
  ]
getCharSprite '#' = unlines [
  "░░░░",
  "░░░░",
  "░░░░"
  ]
getCharSprite '(' = unlines [
  "██░░░░",
  "██░░░░",
  "██░░░░"
  ]
getCharSprite ')' = unlines [
  "░░██",
  "░░██",
  "░░██"
  ]
getCharSprite char = unlines [
  "░░░░",
  "░░░░",
  "░░░░"
  ]

makeTextLines:: [Char] -> String -> [String]
makeTextLines dataList spacer =
    let sprites = map (\char -> getCharSprite char) dataList
    in (concatLines (map (\sprite -> lines sprite) sprites) 0 spacer)

concatLines:: [[String]] -> Int -> String -> [String]
concatLines sprites lineNumber spacer
  | lineNumber < length (sprites !! 0) = [concatLine sprites lineNumber spacer] ++ concatLines sprites (lineNumber+1) spacer
  | otherwise = []

concatLine:: [[String]] -> Int -> String -> String
concatLine (h: []) lineNumber spacer = h !! lineNumber
concatLine (h: t) lineNumber spacer = h !! lineNumber ++ spacer ++ concatLine t lineNumber spacer
