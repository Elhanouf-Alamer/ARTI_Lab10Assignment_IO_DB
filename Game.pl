% Declare the letter predicate
:- dynamic letter/1.

% Initialize the game with the default letters (a, b, c)
init_letters :-
    retractall(letter(_)),
    assertz(letter(a)),
    assertz(letter(b)),
    assertz(letter(c)).

% Game start
start :-
    init_letters,
    game_menu.

% Game menu
game_menu :-
    nl,
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    write('|: '),
    read(Choice),
    process_choice(Choice).

% Option 1
process_choice(1) :-
    nl, write('Current letters in database:'), nl,
    findall(L, letter(L), LetterList),
    writeln(LetterList),
    game_menu.

% Option 2 & 4
process_choice(2) :-
    write('Enter the letter to add: '), nl,
    write('|: '),
    read(L),
    assertz(letter(L)),
    write('Letter added successfully.'), nl,
    game_menu.

% Option 3
process_choice(3) :-
    write('Enter the letter to add at the top: '), nl,
    write('|: '),
    read(L),
    asserta(letter(L)),
    write('Letter added at the top successfully.'), nl,
    game_menu.

% Option 4
process_choice(4) :-
    write('Enter the letter to add at the bottom: '), nl,
    write('|: '),
    read(L),
    assertz(letter(L)),
    write('Letter added at the bottom successfully.'), nl,
    game_menu.

% Option 5
process_choice(5) :-
    write('Enter the letter to delete: '), nl,
    write('|: '),
    read(L),
    ( retract(letter(L)) ->
        write('Letter deleted successfully.')
    ;   write('Letter not found in database.')
    ),
    nl,
    game_menu.

% Option 6
process_choice(6) :-
    retractall(letter(_)),
    write('All letters deleted successfully.'), nl,
    game_menu.

% Option 7
process_choice(7) :-
    write('Exiting Name Game. Goodbye!'), nl.

% Invalid choice
process_choice(_) :-
    write('Invalid choice. Please enter a number between 1 and 7.'), nl,
    game_menu.
