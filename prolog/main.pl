:- use_module('./Battle.pl').
:- use_module('./Drawer.pl').
:- use_module('./Menu.pl').
:- use_module('./Stories.pl').
:- use_module('./Helpers.pl').
:- use_module('./IOHelpers.pl').

main :-
  printMenu(),
  customizeCharacter(CustomColors),
  fubicaStory(),
  battle(CustomColors, [100,100], [100,100],
    "admBoss", [1, 5]),
  daltonStory(),
  battle(CustomColors, [100,100], [100,100],
    "p1Boss", [3, 7]),
  gaudencioStory(),
  battle(CustomColors, [100,100], [100,100],
      "p2Boss", [3, 8]),
  jaStory(),
  battle(CustomColors, [100,100], [100,100],
    "edaBoss", [4, 10]),
  evertonStory(),
  battle(CustomColors, [100,100], [100,100],
      "plpBoss", [6, 10]),
  endGame(),
  main().
