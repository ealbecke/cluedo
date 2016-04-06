% l = left
% c = center
% r = right

% Faits de deplacemets
deplacement(l, c).
deplacement(l, r).
deplacement(c, r).
deplacement(c, l).
deplacement(r, l).
deplacement(r, c).

% Regles de securite des mouvements
deplacementable(_, _, 0) :- !.
deplacementable(X, [H|T], N) :-
    X \= H,
    N1 is N - 1,
    deplacementable(X, T, N1).

% Regles des mouvements
mouvement([X, S2, S3, S4], _, [Y, S2, S3, S4], 1) :-
    deplacement(X, Y).
mouvement([S1, X, S3, S4], T, [S1, Y, S3, S4], 2) :-
    (   
    	deplacement(X, Y),
    	deplacementable(X, T, 1),
    	deplacementable(Y, T, 1)
    );
    X = Y.
mouvement([S1, S2, X, S4], T, [S1, S2, Y, S4], 3) :-
    (
    	deplacement(X, Y),
    	deplacementable(X, T, 2),
    	deplacementable(Y, T, 2)
    );
    X = Y.
mouvement([S1, S2, S3, X], T, [S1, S2, S3, Y], 4) :-
    (
    	deplacement(X, Y),
    	deplacementable(X, T, 3),
    	deplacementable(Y, T, 3)
    );
    X = Y.

% Regles de resolution et verification de la fin
solution([c, c, c, c]) :-
    affiche_hanoi([], ['.../==\\...', '../====\\..', './======\\.', '/========\\'], []),
    nl, !.
solution([r, r, r, r]) :-
    affiche_hanoi([], [], ['.../==\\...', '../====\\..', './======\\.', '/========\\']),
    nl, !.
solution(T) :-
    mouvement(T, T, NT1, 1),
    mouvement(NT1, NT1, NT2, 2),
    mouvement(NT2, NT2, NT3, 3),
    mouvement(NT3, NT3, NT4, 4),
	solution(NT4).

% Affiche une liste
affiche_liste([]) :- !.
affiche_liste([H|T]) :-
    write(H), nl,
    affiche_liste(T).

% Affiche le hanoi
affiche_hanoi(X, Y, Z) :-
    write('Tower 1:'), nl,
    affiche_liste(X), nl,
    write('Tower 2:'), nl,
    affiche_liste(Y), nl,
    write('Tower 3:'), nl,
    affiche_liste(Z), nl.

% Regle principale
resoudre :-
    solution([l, l, l, l]), nl, !.