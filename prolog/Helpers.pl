:- module(Helpers, [concatenate/2, getElementByIndex/3, stringToCharList/2, charListToString/2, unlines/2, lines/2, map/3, cycleChar/3]).

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
lines(String, Lines) :- atomic_list_concat(Lines, '\n', String).

map([], _, []).
map([X|Xs], Transformation, [Y|Ys]) :-
    call(Transformation, X, Y),
    map(Xs, Transformation, Ys).

cycleChar(_, 0, Result) :- Result = "", !.
cycleChar(Char, Quantity, Result) :- 
  QuantityDec is Quantity - 1,
  cycleChar(Char, QuantityDec, R2),
  concatenate([Char, Char, R2], Result), !.
