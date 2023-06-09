:- module(Drawer, [concatLine/4, concatLines/4, mtlMapper/2]).
:- use_module('./Sprites.pl').
:- use_module('./Helpers.pl').


mtlMapper(Text, Result) :-
  getBorderSpacer(" ", BlankLine),
  concatenate(["(", Text, ")"], SpriteLine),
  makeTextLines(SpriteLine, R2),
  append(R2, BlankLine, R3),
  append(R3, BlankLine, Result).

drawTextScreen(Texts, Result) :-
  cycleChar("█", 98, Border),
  concatenate([Border, "\n"], FullBorder),
  getBorderSpacer("░", Margin), 
  makeTextScreenContent(Texts, ScreenContent),
  map(ScreenContent, mtlMapper, R),
  flatten(R, R1),
  append([FullBorder], Margin, R2),
  append(R2, R1, R3),
  append(R3, Margin, R4),
  append(R4, Margin, R5),
  append(R5, [FullBorder], Result), !.


getBorderSpacer(Spacer, Result) :-
  cycleChar(Spacer, 93, CycledSpacer),
  concatenate(["██░░░░", CycledSpacer, "░░██", "\n"], R1),
  Result = [R1].

makeTextLines(Text, Result) :-
  cycleChar(" ", 40, TrailingSpaces),
  concatenate([Text, TrailingSpaces], FullText),
  stringToCharList(FullText, FullTextList),
  splitAt(FullTextList, 40, Line, _),
  map(Line, getCharSprite, Sprites),
  map(Sprites, lines, R2),
  concatLines(R2, 0, " ", Result), !.

% Ensures that the screen has full width and height filling it with whitespaces
makeTextScreenContent(Content, Result) :-
  unlines(Content, UnlinedContent),
  handleBreakLines(UnlinedContent, 0, R2),
  splitLines(R2, 0, Result).

splitLines(Content, LineNumber, Result) :-
  stringToCharList(Content, ParsedContent),
  privateSplitLines(ParsedContent, LineNumber, Result).

privateSplitLines(_, 9, []).
privateSplitLines(Content, LineNumber, Result) :-
  splitAt(Content, 37, Line, Rest),
  LineNumberInc is LineNumber + 1,
  charListToString(Line, LineString),
  privateSplitLines(Rest, LineNumberInc, R2),
  append([LineString], R2, Result), !.

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
