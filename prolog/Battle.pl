:- module(Battle, [battle/6]).
:- use_module('./Drawer.pl').
:- use_module('./IOHelpers.pl').

battle(PlayerColors, PlayerAttributes, BossAttributes, Boss, PlayerCards, CurrentCards) :-

    drawBattlefield(PlayerColors, PlayerAttributes, BossAttributes, 
        Boss, PlayerCards, CurrentCards, Result0), write(Result0),

    write("Escolha uma carta de 1-5\n"),
    read(PlayerChoice),
    % Colocar Dificuldade
    random_between(0, 5, BotChoice),
    write(BotChoice),

    % Desenhando escolha
    drawBattlefield(PlayerColors, [70, 20], [90, 50], 
        Boss, [1, 2, 3, 4, 5], [PlayerChoice, BotChoice], Result1), write(Result1).
