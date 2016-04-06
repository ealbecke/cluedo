%------------------------------------------------------------------------------%
% Regles :                                                                     %
% 1.  L'anglais habite la maison rouge                                         %
% 2.  Le suedois a un chien                                                    %
% 3.  Dans la maison verte on boit du café                                     %
% 4.  Le danois boit du thé                                                    %
% 5.  La maison verte est immédiatement à droite de la maison blanche          %
% 6.  La personne qui fume des Pall Mall a des oiseaux                         %
% 7.  Le propriétaire de la maison jaune fume des Dunhill                      %
% 8.  Dans la maison du milieu on boit du lait                                 %
% 9.  Le norvégien habite la première maison à gauche                          %
% 10. L’homme qui fume des Blend vit à côté de celui qui a des chats           %
% 11. L’homme qui a un cheval est le voisin de celui qui fume des Dunhill      %
% 12. Le propriétaire qui fume des Blue Master boit de la bière                %
% 13. L’Allemand fume des Prince                                               %
% 14. le norvégien habite à côté de la maison bleue                            %
% 15. L’homme qui fume des Blend a un voisin qui boit de l’eau                 %
% 16. On précise que dans une des maisons il y a un poisson                    %
%------------------------------------------------------------------------------%

% liste_des_maisons est une liste de 5 maisons.
% Chaque maison a 5 paramètres qui seront dans l'ordre :
% exemple : maison(couleur,nationalite,animal,boisson,cigare)
liste_des_maisons([
	maison(_, _, _, _, _),
	maison(_, _, _, _, _),
	maison(_, _, _, _, _),
	maison(_, _, _, _, _),
	maison(_, _, _, _, _)
]).

% appartient_a(X,L) : vrai si l'élément X appartient à la liste L
appartient_a(X,[X|_]).
appartient_a(X,[_|L]) :-
    appartient_a(X,L).

% gauche_de(A,B,L) : vrai si A suit B dans la liste L
gauche_de(A, B, [B, A | _]).
gauche_de(A, B, [_ | Y]) :-
    gauche_de(A, B, Y).

% est_voisin_de(A,B,L) : vrai si A et B sont consécutifs dans la liste L
est_voisin_de(A, B, Y) :-
	gauche_de(A, B, Y);
	gauche_de(B, A, Y).

% Affiche la liste
affichage([]) :- !.
affichage([H|T]) :-
	write(H), nl,
	affichage(T).

% Affiche la reponse
reponse(Y) :-
	appartient_a(maison(_,X,poisson,_,_), Y),
  	write('Le poisson appartient a : l\''),
	write(X), nl.

resoudre :-
	liste_des_maisons(MAISONS),
	appartient_a(maison(rouge, anglais, _, _, _), MAISONS),                    %  1
	appartient_a(maison(_,suedois, chien,_,_), MAISONS),                       %  2
	appartient_a(maison(verte,_,_,cafe,_), MAISONS),                           %  3
	appartient_a(maison(_,danois,_,the,_), MAISONS),                           %  4
	gauche_de(maison(verte,_,_,_,_), maison(blanche,_,_,_,_), MAISONS),        %  5
	appartient_a(maison(_,_,oiseaux,_,pallmall), MAISONS),                     %  6
	appartient_a(maison(jaune, _, _, _, dunhill), MAISONS),                    %  7
	MAISONS = [_, _, maison(_, _, _, lait, _), _,_],                           %  8
	MAISONS = [maison(_, norvegien, _, _, _)|_],                               %  9
	est_voisin_de(maison(_,_,_,_,blend), maison(_,_,chats,_,_), MAISONS),      % 10
	est_voisin_de(maison(_,_,_,_,dunhill), maison(_,_,cheval,_,_), MAISONS),   % 11
	appartient_a(maison(_,_,_,biere,bluemaster), MAISONS),                     % 12
	appartient_a(maison(_,allemand,_,_,prince), MAISONS),                      % 13
	est_voisin_de(maison(_,norvegien,_,_,_), maison(bleue,_,_,_,_), MAISONS),  % 14
	est_voisin_de(maison(_,_,_,eau,_), maison(_,_,_,_,blend), MAISONS),        % 15
	appartient_a(maison(_,_,poisson,_,_), MAISONS),                            % 16
	affichage(MAISONS), nl,
	reponse(MAISONS), nl.
