module IOHelpers (clearScreen, onEnterContinue, printTextScreen, printBattlefield, delay) where

import Control.Concurrent (threadDelay)
import Drawer
import System.Process (callCommand)

clearScreen :: IO ()
clearScreen = callCommand "clear"

printTextScreen :: [String] -> IO ()
printTextScreen texts = do
  clearScreen
  mapM_ putStr (drawTextScreen texts)

printBattlefield ::
  [String] ->
  (Int, Int) ->
  (Int, Int) ->
  String ->
  [Int] ->
  [Int] ->
  IO ()
printBattlefield playerColors (playerLife, playerEnergy) (bossLife, bossEnergy) boss playerCards currentCards = do
  let battlefield = drawBattlefield playerColors (playerLife, playerEnergy) (bossLife, bossEnergy) boss playerCards currentCards
  clearScreen
  mapM_ putStr battlefield

onEnterContinue :: IO ()
onEnterContinue = do
  putStrLn " \n=== Pressione enter para continuar. ==="
  line <- getLine :: IO String
  putStrLn "\n\n"

delay :: IO ()
delay = threadDelay (1 * 1000000) -- 1.0 segundo
