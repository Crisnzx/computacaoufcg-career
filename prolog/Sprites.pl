:- use_module('./Helpers.pl').

paintSpritePixels('', _, _, Result) :- Result = "", !.
paintSpritePixels(Sprite, Color, Char, Result) :-
    stringToCharList(Sprite, [Head | Tail]),
    charListToString(Tail, TailString),
    (Head = Char -> (
        paintString(Color, "▓", R2),
        paintSpritePixels(TailString, Color, Char, R3),
        concatenate([R2, R3], Result), !
        ) 
    ; paintSpritePixels(TailString, Color, Char, R2),
      concatenate([Head, R2], Result), !
    ).

paintString(_, "", "").
paintString(Color, Content, Result) :-
    getColorPrefix(Color, ColorCode),
    getColorPrefix("default", DefaultColorCode),
    concatenate([ColorCode, Content, DefaultColorCode], Result).

getColorPrefix("black", "\e[30m").
getColorPrefix("red", "\e[31m").
getColorPrefix("green", "\e[32m").
getColorPrefix("yellow", "\e[33m").
getColorPrefix("blue", "\e[34m").
getColorPrefix("magenta", "\e[35m").
getColorPrefix("cyan", "\e[36m").
getColorPrefix("white", "\e[37m").
getColorPrefix("gray", "\e[90m").
getColorPrefix("lightred", "\e[91m").
getColorPrefix("lightgreen", "\e[92m").
getColorPrefix("lightyellow", "\e[93m").
getColorPrefix("lightblue", "\e[94m").
getColorPrefix("lightmagenta", "\e[95m").
getColorPrefix("lightcyan", "\e[96m").
getColorPrefix("lightgray", "\e[97m").
getColorPrefix("default", "\e[0m").
