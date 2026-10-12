perm_abc(L) :-
    L = [_, _, _],
    member(a, L),               % member() -> a ist element von Liste L
    member(b, L),
    member(c, L), !.


% =========================================================
%   Ohne Cut:
%     Beim Backtracking (;) verschiebt Prolog die Elemente
%     auf andere freie Plaetze -> alle 6 Permutationen:
%       [a,b,c] ; [a,c,b] ; [b,a,c] ; [c,a,b] ; [b,c,a] ; [c,b,a]
%
%   Mit Cut:
%     Nach der ersten gefundenen Belegung ist Schluss.
%       ?- perm_abc(L).
%       L = [a,b,c].          % keine weiteren Loesungen
%
%   Im Testmodus (L schon gebunden, z.B. perm_abc([c,a,b])):
%     Die Antwort (true/false) aendert sich durch den Cut
%     nicht. Er sorgt nur dafuer, dass das Praedikat
%     deterministisch endet, ohne offenen Choice Point.
%     (Prolog wartet also nicht auf ein moegliches ";".)
%
%   Merke:
%     Der Cut wirkt nur, wenn Prolog ihn ERREICHT.
%     Scheitert vorher ein member, kommt Prolog nie beim !
%     an und darf normal zurueckgehen und Alternativen
%     probieren.
% =========================================================