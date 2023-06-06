:- module(Helpers, [concatenate/2, getElementByIndex/3, stringToCharList/2, charListToString/2, unlines/2]).

concatenate([], '').
concatenate([X], X).
concatenate([X, Y], Result) :- atom_concat(X, Y, Result).
concatenate([Head|Tail], Result) :-
  concatenate(Tail, R2), !,
  atom_concat(Head, R2, Result).

getElementByIndex([X|_], 0, X).
getElementByIndex([_|Tail], Index, Element) :-
  Index > 0,              
  NewIndex is Index - 1,
  getElementByIndex(Tail, NewIndex, Element).

stringToCharList(String, Result) :-
  string_chars(String, Result).

charListToString(CharList, Result) :- 
  string_chars(Result, CharList).

unlines(Strings, Result) :- atomic_list_concat(Strings, '\n', Result). 