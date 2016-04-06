% Faits des hommes maries
mari_de(marc, anne).
mari_de(jules, lisa).
mari_de(leon, sylvie).
mari_de(paul, julie).
mari_de(loic, eve).
mari_de(luc, betty).

% Faits et regle des hommes
homme(jean).
homme(jacques).
homme(gerard).
homme(herve).
homme(X) :-
	mari_de(X, _).

% Regle des femmes maries
femme_de(X, Y) :-
	mari_de(Y, X).

% Fait et regle des femmes
femme(valerie).
femme(X) :-
	femme_de(X, _).

% Faits et regle des enfants
enfant_de(jean, marc).
enfant_de(jules, marc).
enfant_de(leon, marc).
enfant_de(lisa, luc).
enfant_de(loic, luc).
enfant_de(gerard, luc).
enfant_de(jacques, jules).
enfant_de(herve, leon).
enfant_de(julie, leon).
enfant_de(paul, loic).
enfant_de(valerie, loic).
enfant_de(X, Y) :-
	femme_de(Y, P),
	enfant_de(X, P).

% Regle des beau-peres
beaupere_de(X, P) :-
    homme(X),
    (
    	mari_de(P, E);
		femme_de(P, E)
    ),
    enfant_de(E, X).

% Regle des belle-meres
bellemere_de(X, P) :-
    femme(X),
    (
    	mari_de(P, E);
		femme_de(P, E)
    ),
    enfant_de(E, X).

% Regle des ancetres
ancetre_de(X, P) :-
    (
		enfant_de(A, X),
		ancetre_de(A, P)
	);
	enfant_de(P, X).
