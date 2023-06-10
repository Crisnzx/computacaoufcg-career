:- use_module('./Helpers.pl').

clearScreen :-
    system('clear').

onEnterContinue :-
  writeln(" \n=== Pressione enter para continuar. ==="),
  read_line(_),
  writeln("\n\n").

printStringList([]).
printStringList([Head|Tail]) :-
  write(Head),
  write("\n"),
  printStringList(Tail).

printTextScreen(Texts) :-
  clearScreen,
  drawTextScreen(Texts, TextScreen),
  maplist(putStr, TextScreen).

delay :-
    sleep(1).