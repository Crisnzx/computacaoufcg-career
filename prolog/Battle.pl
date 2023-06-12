:- module(Battle, [battle/5]).
:- use_module('./Drawer.pl').
:- use_module('./IOHelpers.pl').
:- use_module('./Helpers.pl').

sortear_lista_aleatoria(Tamanho, ValorMaximo, ListaSorteada) :-
    sortear_lista_aleatoria(Tamanho, ValorMaximo, [], ListaSorteada).

sortear_lista_aleatoria(0, _, ListaSorteada, ListaSorteada) :- !.
sortear_lista_aleatoria(Tamanho, ValorMaximo, ListaParcial, ListaSorteada) :-
    random(5, ValorMaximo, NumeroSorteado),
    NovoTamanho is Tamanho - 1,
    sortear_lista_aleatoria(NovoTamanho, ValorMaximo, [NumeroSorteado|ListaParcial], ListaSorteada).
    
battle(PlayerColors, PlayerAttributes, BossAttributes, Boss, Difficulty) :-
    sortear_lista_aleatoria(5, 13, NewCards),
    battle(PlayerColors, PlayerAttributes, BossAttributes, Boss, NewCards, [0, 0], Difficulty, 5).

battle(PlayerColors, PlayerAttributes, BossAttributes, Boss, PlayerCards, CurrentCards, Difficulty, NCards) :-
    % Pegando Dificuldade
    getElementByIndex(Difficulty, 0, D0),
    getElementByIndex(Difficulty, 1, D1),
    % Pegando atributos
    getElementByIndex(PlayerAttributes, 0, PlayerLife),
    getElementByIndex(PlayerAttributes, 1, PlayerEnergy),
    getElementByIndex(BossAttributes, 0, BossLife),
    getElementByIndex(BossAttributes, 1, BossEnergy),

    clearScreen,
    drawBattlefield(PlayerColors, PlayerAttributes, BossAttributes, 
        Boss, PlayerCards, CurrentCards, Result0),
    printStringList(Result0),

    write("Escolha uma carta de 1-5\n"),
    read(PlayerInput),
    PlayerNumber is PlayerInput - 1,
    getElementByIndex(PlayerCards, PlayerNumber, PlayerChoice),
    random_between(D0, D1, BossChoice),

    % Desenhando escolha
    clearScreen,
    drawBattlefield(PlayerColors, PlayerAttributes, BossAttributes, 
    Boss, PlayerCards, [PlayerChoice, BossChoice], Result1), 
    printStringList(Result1),
    delay(),

    % Verificando energia suficiente
    (PlayerChoice > 0, PlayerEnergy >= 15, PlayerEnergyNew is PlayerEnergy - 15; PlayerEnergyNew is PlayerEnergy + 25),
    (BossChoice > 0, BossEnergy >= 15, BossEnergyNew is BossEnergy - 15; BossEnergyNew is 100),

    % Definindo quem leva dano
    (( PlayerChoice > BossChoice, PlayerEnergy >= 15, PlayerLifeNew is PlayerLife, BossLifeNew is BossLife - 10);
    (PlayerChoice < BossChoice , BossEnergy >= 15, BossLifeNew is BossLife, PlayerLifeNew is PlayerLife - 10);
    (PlayerChoice = BossChoice, BossLifeNew is BossLife - 10, PlayerLifeNew is PlayerLife - 10);
    ((PlayerEnergy < 15; BossEnergy < 15), PlayerLifeNew is PlayerLife, BossLifeNew is BossLife)),

    % Zerando cartas
    ((NCards = 5, sortear_lista_aleatoria(4, 12, RandomCards), append([RandomCards, [0]], NewCards), NewNCards is 4);
      (NCards = 4, sortear_lista_aleatoria(3, 12, RandomCards), append([RandomCards, [0, 0]], NewCards), NewNCards is 3);
      (NCards = 3, sortear_lista_aleatoria(5, 12, RandomCards), NewCards = RandomCards, NewNCards is 5)
    ),

    % Continua batalha ou encerra
    PlayerLifeNew > 0,
    BossLifeNew > 0,
    battle(PlayerColors, [PlayerLifeNew, PlayerEnergyNew], [BossLifeNew, BossEnergyNew], Boss, NewCards, [0, 0], Difficulty, NewNCards);
    true.