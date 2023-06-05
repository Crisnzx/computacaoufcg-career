:- use_module('Battle.pl').
:- use_module('Drawer.pl').
:- use_module('Menu.pl').
:- use_module('Stories.pl').

happy(alice).
sad(X) :- not(happy(X)).
