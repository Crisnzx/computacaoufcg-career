:- module(Drawer, [concatLine/4, concatLines/4]).
:- use_module('./Helpers.pl').

concatLines(Sprites, LineNumber, Spacer, Result) :-
  getElementByIndex(Sprites, 0, Sprite),
  length(Sprite, SpriteHeight),
  (LineNumber < SpriteHeight ->
    (
      LineNumberInc is LineNumber + 1,
      concatLine(Sprites, LineNumber, Spacer, R2),
      concatLines(Sprites, LineNumberInc, Spacer, R3),
      append([R2], R3, Result)
    )
    ; Result = []
  ).

concatLine([Head|[]], LineNumber, _, Result) :-
  getElementByIndex(Head, LineNumber, Element),
  concatenate([Element, '\n'], Result).
concatLine([Head|Tail], LineNumber, Spacer, Result) :-
  getElementByIndex(Head, LineNumber, Element),
  concatLine(Tail, LineNumber, Spacer, R2),
  concatenate([Element, Spacer, R2], Result), !.

cycleChar(_, 0, Result) :- Result = "", !.
cycleChar(Char, Quantity, Result) :- 
  QuantityDec is Quantity - 1,
  cycleChar(Char, QuantityDec, R2),
  concatenate([Char, Char, R2], Result), !.
