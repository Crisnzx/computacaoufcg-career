module Menu (printMenu, getColor, customizeCharacter, onChosenOption) where

import Drawer
import IOHelpers
import System.Exit

printMenu :: IO ()
printMenu = do
  printTextScreen ["", "====== computacao ufcg: career ======", "", "   1-iniciar o jogo", "   2-tutorial", "   3-sair"]

  chosenOption <- readLn :: IO Int

  onChosenOption chosenOption

customizedColors :: [String] -> [String]
customizedColors colors = colors

getColor :: Int -> String
getColor 1 = "black"
getColor 2 = "gray"
getColor 3 = "red"
getColor 4 = "green"
getColor 5 = "yellow"
getColor 6 = "blue"
getColor 7 = "magenta"
getColor 8 = "cyan"
getColor 9 = "white"
getColor 10 = "lightgray"
getColor 11 = "lightred"
getColor 12 = "lightgreen"
getColor 13 = "lightyellow"
getColor 14 = "lightblue"
getColor 15 = "lightmagenta"
getColor 16 = "lightcyan"
getColor x = "gray"

onChosenOption :: Int -> IO ()
onChosenOption 1 = startGame
onChosenOption 2 = openTutorial
onChosenOption 3 = exitSuccess
onChosenOption invalidOption = do
  printTextScreen ["-- opcao invalida tente novamente --"]
  delay
  printMenu

startGame :: IO ()
startGame = do
  printTextScreen ["", "", "", "      antes de iniciar o jogo", "", "      customize seu personagem"]
  onEnterContinue

openTutorial :: IO ()
openTutorial = do
  printTextScreen
    [ "tutorial - gameplay",
      "",
      "a cada rodada, 2 cartas sao jogadas:",
      "uma por voce e uma pelo boss",
      "ganha a carta de maior valor,",
      "causando dano no oponente.",
      "em caso de empate, ambos tomam dano"
    ]
  onEnterContinue
  printTextScreen
    [ "tutorial - cartas",
      "",
      "as cartas variam de as ate rei",
      "e causam respectivamente 1 a 13",
      "de dano",
      "todas as cartas custam energia para",
      "serem jogadas"
    ]
  onEnterContinue
  printTextScreen
    [ "tutorial - energia",
      "",
      "a energia eh utilizada para jogar as cartas.",
      "a cada round, um pouco de energia eh restaurada",
      "voce tambem pode selecionar o numero correspondente a uma carta vazia paradescansar e restaurar mais energia"
    ]
  onEnterContinue
  printTextScreen
    [ "tutorial - energia",
      "",
      "caso a energia nao seja suficiente",
      "para jogar a carta",
      "voce descansara automaticamente e ",
      "perdera a carta jogada",
      "preste atencao!"
    ]
  onEnterGoBackToMenu

customizeCharacter :: IO [Int]
customizeCharacter = do
  printTextScreen
    [ "escolha a cor do cabelo:",
      "1- preto           9- branco",
      "2- cinza          10- cinza claro",
      "3- vermelho       11- vermelho claro",
      "4- verde          12- verde claro",
      "5- amarelo        13- amarelo claro",
      "6- azul           14- azul claro",
      "7- magenta        15- magenta claro",
      "8- ciano          16- ciano claro"
    ]
  line1 <- readLn :: IO Int
  printTextScreen
    [ "escolha a cor da pele:",
      "1- preto           9- branco",
      "2- cinza          10- cinza claro",
      "3- vermelho       11- vermelho claro",
      "4- verde          12- verde claro",
      "5- amarelo        13- amarelo claro",
      "6- azul           14- azul claro",
      "7- magenta        15- magenta claro",
      "8- ciano          16- ciano claro"
    ]
  line2 <- readLn :: IO Int
  printTextScreen
    [ "escolha a cor da camisa:",
      "1- preto           9- branco",
      "2- cinza          10- cinza claro",
      "3- vermelho       11- vermelho claro",
      "4- verde          12- verde claro",
      "5- amarelo        13- amarelo claro",
      "6- azul           14- azul claro",
      "7- magenta        15- magenta claro",
      "8- ciano          16- ciano claro"
    ]
  line3 <- readLn :: IO Int
  printTextScreen
    [ "escolha a cor do short:",
      "1- preto           9- branco",
      "2- cinza          10- cinza claro",
      "3- vermelho       11- vermelho claro",
      "4- verde          12- verde claro",
      "5- amarelo        13- amarelo claro",
      "6- azul           14- azul claro",
      "7- magenta        15- magenta claro",
      "8- ciano          16- ciano claro"
    ]
  line4 <- readLn :: IO Int
  printTextScreen
    [ "escolha a cor do tenis:",
      "1- preto           9- branco",
      "2- cinza          10- cinza claro",
      "3- vermelho       11- vermelho claro",
      "4- verde          12- verde claro",
      "5- amarelo        13- amarelo claro",
      "6- azul           14- azul claro",
      "7- magenta        15- magenta claro",
      "8- ciano          16- ciano claro"
    ]
  line5 <- readLn :: IO Int
  let colorList = [line1, line2, line3, line4, line5]
  return colorList

onEnterGoBackToMenu :: IO ()
onEnterGoBackToMenu = do
  putStrLn "\n=== Pressione enter para voltar para o menu inicial. ==="
  line2 <- getLine :: IO String
  printMenu
