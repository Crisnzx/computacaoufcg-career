:- module(Helpers, [concatenate/2, getElementByIndex/3, stringToCharList/2, charListToString/2]).

concatenate([], '').
concatenate([X], X).
concatenate([X, Y], Result) :- atom_concat(X, Y, Result).
concatenate([Head|Tail], Result) :-
  concatenate(Tail, R2),
  atom_concat(Head, R2, Result),!.

getElementByIndex([X|_], 0, X).
getElementByIndex([_|Tail], Index, Element) :-
  Index > 0,              
  NewIndex is Index - 1,
  getElementByIndex(Tail, NewIndex, Element).

stringToCharList("", []).
stringToCharList(String, Result) :- 
  sub_string(String, 0, 1, _, First),
  sub_string(String, 1, _, 0, Rest),
  stringToCharList(Rest, R2),
  Result = [First | R2], !.

charListToString(List, Result) :- concatenate(List, Result).
