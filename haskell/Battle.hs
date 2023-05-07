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

-- CARTAS CUSTAM 20
battle :: BattleState -> IO ()
battle BattleState {playerColors, playerLife, playerEnergy, bossLife, boss, playerCards, currentCards, difficulty} = do
  -- SORTEANDO CARTAS NO INICIO DA PARTIDA CARTAS ZERADAS = 5
  let count = length [x | x <- playerCards, x == 0]
  let aux = playerCards
  randomCards <- sequence [randomRIO (3, 13) | _ <- playerCards]
  let playerCards = if count == 5 then randomCards else aux

  clearScreen
  mapM_ putStr (makeBattlefield playerColors (playerLife, playerEnergy) bossLife boss playerCards currentCards)

  -- ESCOLHA
  -- CARTA 0 REGENERA
  -- BOT TEM ENERGIA INFINITA, DIFICULDADE É O RANGE DO NÚMERO RANDOM
  printf "Escolha uma carta de 1-%d\n" (length playerCards)
  choice <- getPlayerChoice playerEnergy
  bossChoice <- randomRIO difficulty
  let currentCards = [if playerEnergy < 20 then 0 else playerCards !! (choice - 1), bossChoice]

  -- REMOVENDO CARTA DO DECK (ZERANDO A CARTA) E PEGANDO DUAS CARTAS caso forem duas zerada
  -- também pode descansar com uma zerada
  let playerCardsZero = [if i == (choice - 1) then 0 else x | (x, i) <- zip playerCards [0 ..]]
  randomNumber <- randomRIO (2, 12)
  let count = length [x | x <- playerCardsZero, x == 0]
  let playerCardsNew = [if x == 0 && count > 1 then randomNumber else x | x <- playerCardsZero]

  -- DANO (SE CARTAS SÃO IGUAIS, AMBOS LEVAM DANO)
  let bossLifeNew = if head currentCards >= currentCards !! 1 then bossLife - head currentCards else bossLife
  let playerLifeNew = if head currentCards <= currentCards !! 1 then playerLife - (currentCards !! 1) else playerLife

  -- ENERGIA, ao descansar recupera 25, e 5 fixo (BOSS TEM ENERGIA INFINITA)
  -- não permite passar de energia 100
  let playerEnergyNew = if head currentCards == 0 then minimum [playerEnergy + (25 + 5), 100] else minimum [playerEnergy + (-20 + 5), 100]

  clearScreen
  mapM_ putStr (makeBattlefield playerColors (playerLife, playerEnergy) bossLife boss playerCardsZero currentCards)
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
    else battle BattleState {playerColors, playerLife = playerLifeNew, playerEnergy = playerEnergyNew, bossLife = bossLifeNew, boss, playerCards = playerCardsNew, currentCards, difficulty}
