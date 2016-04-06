%------------------------------------------------------------------------------%
% Regles :                                                                     %
% 1.  Le Marocain n’est pas capitaine, il n’a pas 25 ans                       %
% 2.  Le bosco n’a pas 35 ans                                                  %
% 3.  Le timonier grec a plus de 25 ans                                        %
% Quel est l’âge du capitaine ?                                                %
%------------------------------------------------------------------------------%

liste_des_individus([
	individu(_, _, _),
	individu(_, _, _),
	individu(_, _, _)
]).

appartient_a(X,[X|_]).
appartient_a(X,[_|L]) :-
	appartient_a(X,L).

affichage([]) :- !.
affichage([H|T]) :-
	write(H), nl,
	affichage(T).

resoudre :-
	liste_des_individus(INDIVIDUS),
	appartient_a(individu(coreen,_,_), INDIVIDUS),
	appartient_a(individu(_,25,_), INDIVIDUS),
	appartient_a(individu(_,35,_), INDIVIDUS),
	appartient_a(individu(_,42,_), INDIVIDUS),
	appartient_a(individu(marocain,AM,PT), INDIVIDUS),
	appartient_a(individu(_,AB,bosco), INDIVIDUS),
	appartient_a(individu(grec,AT,timonier), INDIVIDUS),
	appartient_a(individu(_,_,capitaine), INDIVIDUS),
	AM \= 25,
	PT \== capitaine,
	AT > 25,
	AB \= 35,
	affichage(INDIVIDUS), !.
