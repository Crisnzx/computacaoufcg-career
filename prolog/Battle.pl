:- module(Battle, [battle/5]).
:- use_module('./Drawer.pl').
:- use_module('./IOHelpers.pl').
:- use_module('./Helpers.pl').

sortear_lista_aleatoria(Tamanho, ValorMaximo, ListaSorteada) :-
    sortear_lista_aleatoria(Tamanho, ValorMaximo, [], ListaSorteada).

sortear_lista_aleatoria(0, _, ListaSorteada, ListaSorteada) :- !.
sortear_lista_aleatoria(Tamanho, ValorMaximo, ListaParcial, ListaSorteada) :-
    random(1, ValorMaximo, NumeroSorteado),
    NovoTamanho is Tamanho - 1,
    sortear_lista_aleatoria(NovoTamanho, ValorMaximo, [NumeroSorteado|ListaParcial], ListaSorteada).
    
battle(PlayerColors, PlayerAttributes, BossAttributes, Boss, Difficulty) :-
    sortear_lista_aleatoria(5, 12, NewCards),
    battle(PlayerColors, PlayerAttributes, BossAttributes, Boss, NewCards, [0, 0], Difficulty).

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
    drawBattlefield(PlayerColors, PlayerAttributes, BossAttributes, 
    Boss, PlayerCards, [PlayerChoice, BossChoice], Result1), 
    write(Result1),
    delay(),


    % Verificando energia suficiente
    (PlayerChoice > 0, PlayerEnergy - 15 > -1, PlayerEnergyNew is PlayerEnergy - 15; PlayerEnergyNew is PlayerEnergy + 25),
    (BossChoice > 0, BossEnergy - 15 > -1, BossEnergyNew is BossEnergy - 15; BossEnergyNew is BossEnergy + 25),

    % Definindo quem leva dano
    ((PlayerChoice > BossChoice, PlayerEnergy - 15 > -1, PlayerLifeNew is PlayerLife, BossLifeNew is BossLife - 10);
    (PlayerChoice < BossChoice , BossEnergy - 15 > -1, BossLifeNew is BossLife, PlayerLifeNew is PlayerLife - 10);
    (PlayerChoice = BossChoice, BossLifeNew is BossLife - 10, PlayerLifeNew is PlayerLife - 10)),

    sortear_lista_aleatoria(5, 12, NewCards),
    % Continua batalha ou encerra
    PlayerLifeNew > 0,
    BossLifeNew > 0,
    battle(PlayerColors, [PlayerLifeNew, PlayerEnergyNew], [BossLifeNew, BossEnergyNew], Boss, NewCards, [0, 0], Difficulty);
    true.