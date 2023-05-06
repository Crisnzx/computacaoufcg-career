module Menu (printMenu, onChosenOption) where
import Drawer
import System.Process (callCommand)
import Control.Concurrent (threadDelay)

clearScreen :: IO ()
clearScreen = callCommand "clear"

printMenu:: IO()
printMenu = do
  clearScreen
  mapM_ putStr (makeTextScreen ["ola bem vindo ao nosso jogo", "computacao ufcg career", "", "---menu---","1-iniciar o jogo", "2-tutorial", "3-customizar personagem", "4-sair"])

  chosenOption <- readLn :: IO Int
  clearScreen

  onChosenOption chosenOption

onChosenOption:: Int -> IO()
onChosenOption 1 = startGame
onChosenOption 2 = openTutorial
onChosenOption 3 = customizeCharacter
onChosenOption 4 = return ()
onChosenOption invalidOption = do
  clearScreen
  mapM_ putStr (makeTextScreen ["-- opcao invalida tente novamente --"])
  threadDelay (1 * 1500000) -- 1.5 segundo
  printMenu
  

startGame:: IO ()
startGame = do
  mapM_ putStr (makeTextScreen ["parabens! voce foi aprovado no curso de computacao da ufcg no sisu 2023.1", "aproveite ao maximo toda experiencia", "proporcionada no curso", "dessa forma temos certeza que", "voce se tornara", "um grande cientista da computacao", "com uma qualificacao altamente acima da media do mercado!!"])
  onEnterContinue
  clearScreen
  mapM_ putStr (makeTextScreen ["antes de iniciar o primeiro periodo", "precisamos conhecer","", "o coordenador fubica..."])

openTutorial:: IO()
openTutorial = do
  mapM_ putStr (makeTextScreen ["tutorial do jogo..."])
  onEnterContinue
  clearScreen
  mapM_ putStr (makeTextScreen ["mais uma linha do tutorial do jogo"])
  onEnterGoBackToMenu

customizeCharacter:: IO()
customizeCharacter = do
  mapM_ putStr (makeTextScreen ["--- customize seu personagem ---", "", ""])
  onEnterGoBackToMenu

onEnterGoBackToMenu:: IO()
onEnterGoBackToMenu = do
  putStrLn "=== Pressione enter para voltar para o menu inicial. ==="
  line2 <- getLine:: IO String
  printMenu


onEnterContinue:: IO()
onEnterContinue = do
  putStrLn " \n\nPressione enter para continuar."
  line <- getLine:: IO String
  putStrLn "\n\n"