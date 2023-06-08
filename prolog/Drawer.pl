:- module(Drawer, [concatLine/4, concatLines/4]).
:- use_module('./Helpers.pl').




% splitLines :: String -> Int -> [String]
% splitLines content 9 = []
% splitLines content lineNumber =
%   let (line, rest) = splitAt 37 content
%   in line : splitLines rest (lineNumber + 1)

splitLines(Content, LineNumber, Result) :-
  stringToCharList(Content, ParsedContent),
  privateSplitLines(ParsedContent, LineNumber, Result).

privateSplitLines(_, 9, []).
privateSplitLines(Content, LineNumber, Result) :-
  splitAt(Content, 37, Line, Rest),
  LineNumberInc is LineNumber + 1,
  privateSplitLines(Rest, LineNumberInc, R2),
  append(Line, R2, Result).


handleBreakLines(Text, CharCount, Result) :-
  stringToCharList(Text, ParsedText),
  privateHandleBreakLines(ParsedText, CharCount, Result).


privateHandleBreakLines([], _, Result) :-
  cycleChar(" ", 333, Result).

privateHandleBreakLines([Char|Tail], CharCount, Result) :-
  (Char = '\n' -> (
    SpacesQuantity is (37 - (CharCount mod 37) // 2),
    cycleChar(" ", SpacesQuantity, R1),
    privateHandleBreakLines(Tail, 0, R2),
    concatenate([R1, R2], Result), !
    )
  ; 
    CharCountInc is CharCount + 1,
    privateHandleBreakLines(Tail, CharCountInc, R1),
    concatenate([Char, R1], Result), !
).






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
