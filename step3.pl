%------------------------------------------------------------------------------%
% Enonce :                                                                     %
% Un brave peon est sur le bord d’une rivière en compagnie de sa chèvre,       %
% son loup, et un chou. Il n’a qu’une barque maigrelette pour traverser la     %
% rivière, et cette barque ne peut supporter que deux êtres/objets à la fois.  %
% Evidemment, il faut toujours quelqu’un capable de ramer pour faire avancer   %
% la barque. A cela s’ajoute la dure loi de la nature: il ne peut pas          %
% laisser la chèvre et le chou ensemble sans surveillance (la chèvre mangerait %
% le chou), ni laisser la chèvre avec le loup.                                 %
%------------------------------------------------------------------------------%

% Permet de remplacer les positions sur les rives
remplacement(droite,gauche).
remplacement(gauche,droite).

% Mouvement du loup et du peon
mouvement([X, X, Chevre, Chou], 'avec le loup', [Y, Y, Chevre, Chou]) :- 
    remplacement(X, Y).

% Mouvement de la chevre et du peon
mouvement([X, Loup, X, Chou], 'avec la chevre', [Y, Loup, Y, Chou]) :-
    remplacement(X, Y).

% Mouvement du chou et du peon
mouvement([X, Loup, Chevre, X], 'avec le chou', [Y, Loup, Chevre, Y]) :-
    remplacement(X, Y).

% Mouvement du peon
mouvement([X, Loup, Chevre, Chou], 'seul', [Y, Loup, Chevre, Chou]) :-
    remplacement(X, Y).

% Permet de tester une egalite
egalite(X,X,_).
egalite(X,_,X).

% Permet de tester si la chevre est avec le chou, ou le loup
securite([Peon, Loup, Chevre, Chou]) :-
    egalite(Peon, Loup, Chevre),
    egalite(Peon, Chevre, Chou).

% Solution resout le probleme
solution([droite, droite, droite, droite], []).
solution(Position, [Mouvement|Mouvement_Suivant]) :-
    mouvement(Position, Mouvement, Nouvelle_Position),
    securite(Nouvelle_Position),
    solution(Nouvelle_Position, Mouvement_Suivant).

% Definis le sens de la traversee
affiche_direction(1) :-
		write('Traverse (vers la droite) ').
affiche_direction(0) :-
		write('Traverse (vers la gauche) ').

% Affichage complet
affichage([], _) :- !.
affichage([X|Y], N) :-
	write(N), write(': '),
	N2 is N mod 2,
	affiche_direction(N2),
	write(X), nl,
	N1 is N + 1,
	affichage(Y, N1).

% Lance la resolution
resoudre :-
    X = [_,_,_,_,_,_,_],
    solution([gauche, gauche, gauche, gauche], X), !,
	affichage(X, 1), nl.
