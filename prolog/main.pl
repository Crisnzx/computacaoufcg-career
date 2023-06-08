:- use_module('./Battle.pl').
:- use_module('./Drawer.pl').
:- use_module('./Menu.pl').
:- use_module('./Stories.pl').
:- use_module('./Helpers.pl').
:- use_module('./IOHelpers.pl').

main :-
  concatenate(['1', '2', '3'], Result),
  write(Result).

