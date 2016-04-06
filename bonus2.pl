%------------------------------------------------------------------------------%
% Regles :                                                                     %
% 1. L'Anglais habite au milieu.                                               %
% 2. Le Chinois est musicien.                                                  %
% 3. Le timonier grec a plus de 25 ans                                         %
% 4. On ne sait rien sur le Français.                                          %
% 5. L'espion habite la première maison.                                       %
% Quel est l’espion ?                                                          %
%------------------------------------------------------------------------------%

liste_des_maisons([
maison(_, _, _),
maison(_, _, _),
maison(_, _, _)
]).

affichage([]) :- !.
affichage([H|T]) :-
    write(H), nl,
    affichage(T).

appartient_a(X,[X|_]).
appartient_a(X,[_|L]) :-
    appartient_a(X,L).

resoudre :-
    liste_des_maisons(MAISONS),
    appartient_a(maison(troisieme,_,_), MAISONS),
    appartient_a(maison(_,_,autre), MAISONS),
    appartient_a(maison(_,francais,_), MAISONS),
    appartient_a(maison(milieu, anglais, _), MAISONS),
    appartient_a(maison(_,chinois, musicien), MAISONS),
    appartient_a(maison(premiere,_,espion), MAISONS),
    affichage(MAISONS), !.
