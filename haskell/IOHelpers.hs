module IOHelpers (clearScreen, onEnterContinue, printTextScreen, delay) where
import Drawer
import System.Process (callCommand)
import Control.Concurrent (threadDelay)

clearScreen :: IO ()
clearScreen = callCommand "clear"

printTextScreen:: [String] -> IO()
printTextScreen texts = do
  clearScreen
  mapM_ putStr (makeTextScreen texts)

onEnterContinue:: IO()
onEnterContinue = do
  putStrLn " \n=== Pressione enter para continuar. ==="
  line <- getLine:: IO String
  putStrLn "\n\n"


delay:: IO()
delay = threadDelay (1 * 1000000) -- 1.0 segundo
