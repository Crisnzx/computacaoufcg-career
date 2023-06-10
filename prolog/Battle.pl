:- module(Battle, [battle/7]).
:- use_module('./Drawer.pl').
:- use_module('./IOHelpers.pl').
:- use_module('./Helpers.pl').

battle(PlayerColors, PlayerAttributes, BossAttributes, Boss, PlayerCards, CurrentCards, Difficulty) :-
    % Pegando Dificuldade
    getElementByIndex(Difficulty, 0, D0),
    getElementByIndex(Difficulty, 1, D1),
    % Pegando atributos
    getElementByIndex(PlayerAttributes, 0, PlayerLife),
    getElementByIndex(PlayerAttributes, 1, PlayerEnergy),
    getElementByIndex(BossAttributes, 0, BossLife),
    getElementByIndex(BossAttributes, 1, BossEnergy),

    drawBattlefield(PlayerColors, PlayerAttributes, BossAttributes, 
        Boss, PlayerCards, CurrentCards, Result0), write(Result0),

    write("Escolha uma carta de 0-4\n"),
    read(PlayerNumber),
    getElementByIndex(PlayerCards, PlayerNumber, PlayerChoice),
    random_between(D0, D1, BossChoice),

    % Desenhando escolha
    drawBattlefield(PlayerColors, [PlayerLife, PlayerEnergy], [PlayerLife, PlayerEnergy], 
    Boss, [1, 2, 3, 4, 5], [PlayerChoice, BossChoice], Result1), write(Result1).

    % Definindo quem leva dano
    (PlayerChoice > BossChoice -> 
        BossLifeNew is BossLife - 10, PlayerLifeNew = PlayerLife;
        PlayerLifeNew is PlayerLife - 10, BossLifeNew = BossLife ),

    % Desenhando Dano
    drawBattlefield(PlayerColors, [PlayerLifeNew, 20], [BossLifeNew, 50], 
        Boss, [1, 2, 3, 4, 5], [PlayerChoice, BossChoice], Result2), write(Result2),

    battle(PlayerColors, [PlayerLifeNew, PlayerEnergy], [BossLifeNew, BossEnergy], Boss, PlayerCards, [0, 0], Difficulty).