perm_abc(L) :-
    L = [_, _, _],
    member(a, L),
    member(b, L),
    member(c, L), !.

% TODO a): Fuege an geeigneter Stelle einen Cut-Operator (!) ein,
%          sodass nur noch EINE Permutation erzeugt wird.
% TODO b): Begruende, warum dieser Einsatz ein Red Cut ist.
