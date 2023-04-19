module Menu (printMenu, onChosenOption) where

printMenu:: IO()
printMenu = do
  putStrLn "Ola, bem vindo ao nosso jogo computacao ufcg career."
  putStrLn "============ MENU ============"
  putStrLn "1- Iniciar o jogo"
  putStrLn "2- Tutorial"
  putStrLn "3- Conhecer os desenvolvedores"
  putStrLn "4- Sair"

  chosenOption <- readLn :: IO Int
  onChosenOption chosenOption

onChosenOption:: Int -> IO()
onChosenOption 1 = startGame
onChosenOption 2 = openTutorial
onChosenOption 3 = knowTheDevelopers
onChosenOption 4 = return ()
onChosenOption invalidOption = do
  putStrLn "\nOpção inválida, tente novamente\n"
  printMenu
  

startGame:: IO ()
startGame = do
  putStrLn "Start game"

openTutorial:: IO()
openTutorial = do
  putStrLn "Tutorial do jogo..."
  putStrLn " \n\nPressione enter para continuar."
  line <- getLine:: IO String
  putStrLn "Mais uma linha do tutorial..."
  goBackToMenu

knowTheDevelopers:: IO()
knowTheDevelopers = do
  putStrLn "Developers"
  goBackToMenu

goBackToMenu:: IO()
goBackToMenu = do
  putStrLn "Pressione enter para voltar para o menu inicial."
  line2 <- getLine:: IO String
  printMenu