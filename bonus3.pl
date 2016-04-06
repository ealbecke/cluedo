%------------------------------------------------------------------------------%
% Regles :                                                                     %
% 1. Princesse aime Manger                                                     %
% 2. On ne joue pas avec le coussin                                            %
% 3. L'outil d'Aramis n'est ni la salade ni le coussin                         %
% 4. On utilise pas la salade pour dormir                                      %
% 5. L'outil de Gribouille est le coussin                                      %
% Qui fait quoi ?                                                              %
%------------------------------------------------------------------------------%

liste_des_infos([
info(_,_,_),
info(_,_,_),
info(_,_,_)
]).

affichage([]) :- !.
affichage([H|T]) :-
    write(H), nl,
    affichage(T).

appartient_a(X,[X|_]).
appartient_a(X,[_|L]) :-
    appartient_a(X,L).

resoudre :-
    liste_des_infos(INFOS),
    appartient_a(info(_,_,dormir), INFOS),
    appartient_a(info(_,_,jouer), INFOS),
    appartient_a(info(princesse,_,manger), INFOS),
    appartient_a(info(_,coussin,NJ), INFOS),
    appartient_a(info(aramis,balle,_), INFOS),
    appartient_a(info(_,salade,ND), INFOS),
    appartient_a(info(gribouille,coussin,_), INFOS),
    NJ \== jouer,
    ND \== dormir,
    affichage(INFOS), !.
