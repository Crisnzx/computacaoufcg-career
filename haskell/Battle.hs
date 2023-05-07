{-# LANGUAGE NamedFieldPuns #-}

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
    bossEnergy :: Int,
    boss :: String,
    playerCards :: [Int],
    currentCards :: [Int],
    difficulty :: (Int, Int)
  }

getPlayerChoice :: Int -> IO Int
getPlayerChoice energy = do
  choice <- getLine
  case readMaybe choice of
    Just n
      | n >= 1 && n <= 5 -> return n
      | otherwise -> do
          printf "Escolha inválida\n"
          getPlayerChoice energy

battle :: BattleState -> IO ()
battle BattleState {playerColors, playerLife, playerEnergy, bossLife, bossEnergy, boss, playerCards, currentCards, difficulty} = do
  -- SORTEANDO CARTAS NO INICIO DA PARTIDA CARTAS ZERADAS = 5
  let count = length [x | x <- playerCards, x == 0]
  let aux = playerCards
  randomCards <- sequence [randomRIO (3, 13) | _ <- playerCards]
  let playerCards = if count == 5 then randomCards else aux

  clearScreen
  mapM_ putStr (makeBattlefield playerColors (playerLife, playerEnergy) (bossLife, bossEnergy) boss playerCards currentCards)

  -- ESCOLHA
  -- CARTAS > 0 CUSTAM 20
  -- CARTA 0 REGENERA
  -- DIFICULDADE É O RANGE DO NÚMERO RANDOM
  printf "Escolha uma carta de 1-%d\n" (length playerCards)
  choice <- getPlayerChoice playerEnergy
  bossChoice <- randomRIO difficulty
  let currentCards = [if playerEnergy < 20 then 0 else playerCards !! (choice - 1), if bossEnergy < 20 then 0 else bossChoice]

  -- REMOVENDO CARTA DO DECK (ZERANDO A CARTA) E PEGANDO DUAS CARTAS caso forem duas zerada
  -- também pode descansar com uma zerada
  let playerCardsZero = [if i == (choice - 1) then 0 else x | (x, i) <- zip playerCards [0 ..]]
  randomNumber <- randomRIO (2, 12)
  let count = length [x | x <- playerCardsZero, x == 0]
  let playerCardsNew = [if x == 0 && count > 1 then randomNumber else x | x <- playerCardsZero]

  -- DANO (SE CARTAS SÃO IGUAIS, AMBOS LEVAM DANO)
  let bossLifeNew = if head currentCards >= currentCards !! 1 then bossLife - head currentCards else bossLife
  let playerLifeNew = if head currentCards <= currentCards !! 1 then playerLife - (currentCards !! 1) else playerLife

  -- ENERGIA, ao descansar recupera 25, e 5 fixo
  -- não permite passar de energia 100
  -- O BOSS DESCANSA DEPOIS DE 5 ATAQUES, RECUPERANDO A ENERGIA TODA
  let playerEnergyNew = if head currentCards == 0 then minimum [playerEnergy + (25 + 5), 100] else minimum [playerEnergy + (-20 + 5), 100]
  let bossEnergyNew = if currentCards !! 1 == 0 then 100 else bossEnergy - 20

  -- MOSTRA JOGADA DO PLAYER
  clearScreen
  mapM_ putStr (makeBattlefield playerColors (playerLife, playerEnergyNew) (bossLife, bossEnergy) boss playerCardsZero [head currentCards, 0])
  delay

  -- MOSTRA JOGADA DO BOT
  clearScreen
  mapM_ putStr (makeBattlefield playerColors (playerLife, playerEnergyNew) (bossLife, bossEnergyNew) boss playerCardsZero currentCards)
  delay

  -- MOSTRA DANO
  clearScreen
  mapM_ putStr (makeBattlefield playerColors (max 0 playerLifeNew, playerEnergyNew) (max 0 bossLifeNew, bossEnergyNew) boss playerCardsZero currentCards)
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
    else battle BattleState {playerColors, playerLife = playerLifeNew, playerEnergy = playerEnergyNew, bossLife = bossLifeNew, bossEnergy = bossEnergyNew, boss, playerCards = playerCardsNew, currentCards = [0, 0], difficulty}
