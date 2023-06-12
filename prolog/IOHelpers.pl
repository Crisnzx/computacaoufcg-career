:- module(IOHelpers, [printStringList/1, printTextScreen/1, clearScreen/0, onEnterContinue/0, delay/0]).
:- use_module('./Helpers.pl').
:- use_module('./Drawer.pl').

clearScreen :-
  tty_clear.

onEnterContinue :-
  writeln(" \n=== Pressione enter para continuar. ==="),
  get_single_char(_),
  writeln("\n\n").

printStringList([]).
printStringList([Head|Tail]) :-
  write(Head),
  printStringList(Tail).

printTextScreen(Texts) :-
  clearScreen,
  drawTextScreen(Texts, TextScreen),
  maplist(write, TextScreen).

delay :-
    sleep(1).