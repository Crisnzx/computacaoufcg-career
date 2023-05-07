module Battle where

import Drawer
import IOHelpers
import System.Exit
import System.Random
import Text.Printf (printf)
import Text.Read (readMaybe)

data BattleState = BattleState
  { playerColors :: [String],
    playerLife :: Int,
    playerEnergy :: Int,
    bossLife :: Int,
    boss :: String,
    playerCards :: [Int],
    currentCards :: [Int],
    bossCards :: [Int]
  }

getPlayerChoice :: IO Int
getPlayerChoice = do
  choice <- getLine
  case readMaybe choice of
    Just n
      | n >= 1 && n <= 5 -> return n
      | otherwise -> do
          printf "Escolha inválida\n"
          getPlayerChoice

battle :: BattleState -> IO ()
battle BattleState {playerColors, playerLife, playerEnergy, bossLife, boss, playerCards, currentCards, bossCards} = do
  clearScreen
  mapM_ putStr (makeBattlefield playerColors (playerLife, playerEnergy) bossLife boss playerCards currentCards)
  print playerCards
  print bossCards

  -- ESCOLHA (O BOT E PLAYER PODEM ESCOLHER CARTAS DE VALOR ZERO, estou pensando sobre a criação de getBotChoice)
  printf "Escolha uma carta de 1-%d\n" (length playerCards)
  choice <- getPlayerChoice
  gen <- newStdGen
  let (bossChoice, _) = randomR (1, 5) gen :: (Int, StdGen)
  let currentCards = [playerCards !! (choice - 1), bossCards !! (bossChoice - 1)]

  -- REMOVENDO CARTA DO DECK (ZERANDO A CARTA)
  let playerCardsNew = [if i == (choice - 1) then 0 else x | (x, i) <- zip playerCards [0 ..]]
  let bossCardsNew = [if i == (bossChoice - 1) then 0 else x | (x, i) <- zip bossCards [0 ..]]

  -- DANO (SE CARTAS SÃO IGUAIS, AMBOS LEVAM DANO)
  let bossLifeNew = if head currentCards >= currentCards !! 1 then bossLife - head currentCards else bossLife
  let playerLifeNew = if head currentCards <= currentCards !! 1 then playerLife - (currentCards !! 1) else playerLife

  -- ENERGIA, ao descansar recupera 25, e 5 fixo (BOSS TEM ENERGIA INFINITA)
  -- não permite passar de energia 100
  let playerEnergyNew = if head currentCards == 0 then minimum [playerEnergy + (25 + 5), 100] else minimum [playerEnergy + (-20 + 5), 100]

  delay
  if bossLifeNew <= 0 || playerLifeNew <= 0
    then do
      if bossLifeNew <= 0 && playerLifeNew > 0
        then do
          printTextScreen ["voce derrotou o boss"]
          delay
        else do
          printTextScreen ["voce perdeu"]
          delay
          exitSuccess
    else battle BattleState {playerColors, playerLife = playerLifeNew, playerEnergy = playerEnergyNew, bossLife = bossLifeNew, boss, playerCards = playerCardsNew, currentCards, bossCards = bossCardsNew}
