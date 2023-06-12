:- module(Menu, [printMenu/0, customizeCharacter/1, getColor/2]).
:- use_module('./Drawer.pl').
:- use_module('./IOHelpers.pl').
:- use_module('./Helpers.pl').


printMenu :-
  printTextScreen(["", "====== computacao ufcg: career ======", "", "   1-iniciar o jogo", "   2-tutorial", "   3-sair"]),
  read(ChosenOption),
  onChosenOption(ChosenOption).

getColor(1, "black").
getColor(2, "gray").
getColor(3, "red").
getColor(4, "green").
getColor(5, "yellow").
getColor(6, "blue").
getColor(7, "magenta").
getColor(8, "cyan").
getColor(9, "white").
getColor(10, "lightgray").
getColor(11, "lightred").
getColor(12, "lightgreen").
getColor(13, "lightyellow").
getColor(14, "lightblue").
getColor(15, "lightmagenta").
getColor(16, "lightcyan").

onChosenOption(1) :-
    startGame.
onChosenOption(2) :-
    openTutorial.
onChosenOption(3) :-
    halt.
onChosenOption(InvalidOption) :-
    printTextScreen(["-- opcao invalida tente novamente --"]),
    delay,
    printMenu.

startGame :-
  printTextScreen(["       antes de iniciar o jogo", "", "      customize seu personagem"]),
  onEnterContinue.

openTutorial :-
  printTextScreen(["tutorial - gameplay",
                   "",
                   "a cada rodada, 2 cartas sao jogadas:",
                   "uma por voce e uma pelo boss",
                   "ganha a carta de maior valor,",
                   "causando dano no oponente.",
                   "em caso de empate, ambos tomam dano"]),
  onEnterContinue,
  printTextScreen(["tutorial - cartas",
                   "",
                   "as cartas variam de as ate rei",
                   "e causam respectivamente 1 a 13",
                   "de dano",
                   "todas as cartas custam energia para",
                   "serem jogadas"]),
  onEnterContinue,
  printTextScreen(["tutorial - energia",
                   "",
                   "a energia eh utilizada para jogar as cartas.",
                   "a cada round, um pouco de energia eh restaurada",
                   "voce tambem pode selecionar o numero correspondente a uma carta vazia paradescansar e restaurar mais energia"]),
  onEnterContinue,
  printTextScreen(["tutorial - energia",
                   "",
                   "caso a energia nao seja suficiente",
                   "para jogar a carta",
                   "voce descansara automaticamente e ",
                   "perdera a carta jogada",
                   "preste atencao!"]),
  onEnterGoBackToMenu.


customizeCharacter(Result) :-
  printTextScreen(["escolha a cor do cabelo:",
                   "1- preto           9- branco",
                   "2- cinza          10- cinza claro",
                   "3- vermelho       11- vermelho claro",
                   "4- verde          12- verde claro",
                   "5- amarelo        13- amarelo claro",
                   "6- azul           14- azul claro",
                   "7- magenta        15- magenta claro",
                   "8- ciano          16- ciano claro"]),
  read(Line1),
  printTextScreen(["escolha a cor da pele:",
                   "1- preto           9- branco",
                   "2- cinza          10- cinza claro",
                   "3- vermelho       11- vermelho claro",
                   "4- verde          12- verde claro",
                   "5- amarelo        13- amarelo claro",
                   "6- azul           14- azul claro",
                   "7- magenta        15- magenta claro",
                   "8- ciano          16- ciano claro"]),
  read(Line2),
  printTextScreen(["escolha a cor da camisa:",
                   "1- preto           9- branco",
                   "2- cinza          10- cinza claro",
                   "3- vermelho       11- vermelho claro",
                   "4- verde          12- verde claro",
                   "5- amarelo        13- amarelo claro",
                   "6- azul           14- azul claro",
                   "7- magenta        15- magenta claro",
                   "8- ciano          16- ciano claro"]),
  read(Line3),
  printTextScreen(["escolha a cor do short:",
                   "1- preto           9- branco",
                   "2- cinza          10- cinza claro",
                   "3- vermelho       11- vermelho claro",
                   "4- verde          12- verde claro",
                   "5- amarelo        13- amarelo claro",
                   "6- azul           14- azul claro",
                   "7- magenta        15- magenta claro",
                   "8- ciano          16- ciano claro"]),
  read(Line4),
  printTextScreen(["escolha a cor do tenis:",
                   "1- preto           9- branco",
                   "2- cinza          10- cinza claro",
                   "3- vermelho       11- vermelho claro",
                   "4- verde          12- verde claro",
                   "5- amarelo        13- amarelo claro",
                   "6- azul           14- azul claro",
                   "7- magenta        15- magenta claro",
                   "8- ciano          16- ciano claro"]),
  read(Line5),
  map([Line1, Line2, Line3, Line4, Line5], getColor, Result).

onEnterGoBackToMenu :-
  writeln("\n=== Pressione enter para voltar para o menu inicial. ==="),
  get_single_char(_),
  printMenu.