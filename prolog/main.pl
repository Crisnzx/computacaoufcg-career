:- use_module('./Battle.pl').
:- use_module('./Drawer.pl').
:- use_module('./Menu.pl').
:- use_module('./Stories.pl').
:- use_module('./Helpers.pl').
:- use_module('./IOHelpers.pl').

main :-
  battle(["red", "magenta", "green", "yellow", "blue"], [70, 10], [10, 100], 
    "admBoss", [1, 2, 3, 4, 5], [0, 0], [1, 5]),
  battle(["red", "magenta", "green", "yellow", "blue"], [70, 20], [90, 50], 
    "p1Boss", [1, 2, 3, 4, 5], [0, 0], [3, 7]),
  battle(["red", "magenta", "green", "yellow", "blue"], [70, 20], [90, 50], 
      "p2Boss", [1, 2, 3, 4, 5], [0, 0], [3, 8]),
  battle(["red", "magenta", "green", "yellow", "blue"], [70, 20], [90, 50], 
    "edaBoss", [1, 2, 3, 4, 5], [0, 0], [4, 10]),
  battle(["red", "magenta", "green", "yellow", "blue"], [70, 20], [90, 50], 
      "plpBoss", [1, 2, 3, 4, 5], [0, 0], [6, 10]).
