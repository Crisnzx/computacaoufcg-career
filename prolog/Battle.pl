:- module(Battle, [battle/7]).
:- use_module('./Drawer.pl').
:- use_module('./IOHelpers.pl').
:- use_module('./Helpers.pl').

battle(PlayerColors, PlayerAttributes, BossAttributes, Boss, PlayerCards, CurrentCards, Difficulty) :-
    % Pegando Dificuldade
    getElementByIndex(Difficulty, 0, D0),
    getElementByIndex(Difficulty, 1, D1),

    drawBattlefield(PlayerColors, PlayerAttributes, BossAttributes, 
        Boss, PlayerCards, CurrentCards, Result0), write(Result0),

    write("Escolha uma carta de 0-4\n"),
    read(PlayerChoice),
    getElementByIndex(PlayerCards, PlayerChoice, PlayerCARD),
    random_between(D0, D1, BotChoice),

    % Desenhando escolha
    drawBattlefield(PlayerColors, [70, 20], [90, 50], 
        Boss, [1, 2, 3, 4, 5], [PlayerCARD, BotChoice], Result1), write(Result1).
