:- use_module('./Helpers.pl').

printStringList([]).
printStringList([Head|Tail]) :-
  write(Head),
  write("\n"),
  printStringList(Tail).
