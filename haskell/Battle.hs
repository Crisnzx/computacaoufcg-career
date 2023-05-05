module Battle where

import Control.Concurrent (threadDelay)
import Drawer
import System.Process (callCommand)
import System.Random
import Text.Printf (printf)
import Text.Read (readMaybe)

clearScreen :: IO ()
clearScreen = callCommand "clear"

data BattleState = BattleState
  { playerLife :: Int,
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
battle BattleState {playerLife, bossLife, boss, playerCards, currentCards, bossCards} = do
  clearScreen
  mapM_ putStr (makeBattlefield playerLife bossLife boss playerCards currentCards)
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
  let bossLifeNew = if head currentCards >= currentCards !! 1 then bossLife - 10 else bossLife
  let playerLifeNew = if head currentCards <= currentCards !! 1 then playerLife - 10 else playerLife

  threadDelay (1 * 1000000) -- 1 segundo
  if bossLifeNew <= 0 || playerLifeNew <= 0
    then do
      if bossLifeNew <= 0 && playerLifeNew > 0
        then do
          clearScreen
          printf "\ESC[32mVOCÊ DERROTOU O BOSS\n"
          threadDelay (1 * 1000000)
        else do
          clearScreen
          printf "\ESC[31mVOCÊ PERDEU\n"
          threadDelay (1 * 1000000)
    else battle BattleState {playerLife = playerLifeNew, bossLife = bossLifeNew, boss, playerCards = playerCardsNew, currentCards, bossCards = bossCardsNew}
