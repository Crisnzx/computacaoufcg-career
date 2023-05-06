module Menu (printMenu, onChosenOption) where
import Drawer

printMenu:: IO()
printMenu = do
  mapM_ putStr (makeTextScreen ["ola, bem vindo ao nosso jogo computacao ufcg career."])
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
  putStrLn "Parabéns! Você foi aprovado no curso de Computação da UFCG pelo sisu 2023.1"
  putStrLn "Aproveite ao máximo toda a experiência proporcionada no curso, dessa forma temos certeza"
  putStrLn "Que você se tornará um grande cientista da computação com uma qualificação altamente acima da média do mercado"
  putStrLn "Lembre-se que para que você tenha sucesso na jornada será necessário muita dedicação e estudo"
  putStrLn "Mas também tenha em mente que apenas o conhecimento técnico não é tudo."
  putStrLn "aproveite para fazer grandes amigos e a aprender e ensinar com os outros, pois a experiência social também"
  putStrLn "Tem um papel importantíssimo na sua formação profissional"
  onEnterContinue
  putStrLn "Antes de iniciar o primeiro período, precisamos conhecer o coordenador Fubica..."

openTutorial:: IO()
openTutorial = do
  putStrLn "Tutorial do jogo..."
  onEnterContinue
  putStrLn "Mais uma linha do tutorial..."
  onEnterGoBackToMenu

knowTheDevelopers:: IO()
knowTheDevelopers = do
  putStrLn "Developers"
  onEnterGoBackToMenu

onEnterGoBackToMenu:: IO()
onEnterGoBackToMenu = do
  putStrLn "Pressione enter para voltar para o menu inicial."
  line2 <- getLine:: IO String
  printMenu


onEnterContinue:: IO()
onEnterContinue = do
  putStrLn " \n\nPressione enter para continuar."
  line <- getLine:: IO String
  putStrLn "\n\n"