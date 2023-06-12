:- module(Helpers, [concatenate/2, getElementByIndex/3, stringToCharList/2, charListToString/2, unlines/2, lines/2, map/3, cycleChar/3, splitAt/4]).
:- use_module('./Sprites.pl').
:- use_module('./Drawer.pl').
:- use_module('./Menu.pl').

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
cycleChar(_, 0.0, Result) :- Result = "", !.
cycleChar(Char, Quantity, Result) :- 
  QuantityDec is Quantity - 0.5,
  cycleChar(Char, QuantityDec, R2),
  concatenate([Char, R2], Result), !.

splitAt(List, Index, Before, After) :-
  length(List, Length),
  Length >= Index,
  splitAtHelper(List, Index, Before, After).

splitAtHelper(List, 0, [], List).
splitAtHelper([X|Xs], Index, [X|Before], After) :-
    Index > 0,
    NextIndex is Index - 1,
    splitAtHelper(Xs, NextIndex, Before, After).
