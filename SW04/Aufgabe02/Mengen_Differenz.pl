% ---------------------------------------------------------
% set_difference(Set1, Set2, SetDifference)
%   SetDifference enthält alle Elemente aus Set1, die NICHT
%   in Set2 vorkommen. Alle drei Mengen sind Listen.
%
%   Verwendet das eingebaute member/2 zusammen mit dem
%   Negations-Prädikat \+/1 -- ohne delete/2.
% ---------------------------------------------------------

set_difference([], _, []).             % simple case: leere Liste -> leere Differenz
set_difference([H | T], Set2, SetDifference) :-
    member(H, Set2),                   % H ist in Set2 -> weglassen
    set_difference(T, Set2, SetDifference).
set_difference([H | T], Set2, [H | SetDifference]) :-
    \+ member(H, Set2),                % H ist NICHT in Set2 -> behalten
    set_difference(T, Set2, SetDifference).


% =========================================================
% Ablaufskizze fuer:
%   ?- set_difference([a,b,c,d], [b,d,e,f], D).
%
% Abstieg (Set2 = [b,d,e,f] bleibt die ganze Zeit gleich):
%
%   set_difference([a,b,c,d], Set2, D)      Kl. 3: a nicht in Set2
%                                            -> behalten: D  = [a | D1]
%   set_difference([b,c,d],   Set2, D1)     Kl. 2: b IST in Set2
%                                            -> weglassen: D1 wird nur
%                                               durchgereicht
%   set_difference([c,d],     Set2, D1)     Kl. 3: c nicht in Set2
%                                            -> behalten: D1 = [c | D2]
%   set_difference([d],       Set2, D2)     Kl. 2: d IST in Set2
%                                            -> weglassen: D2 wird nur
%                                               durchgereicht
%   set_difference([],        Set2, D2)     Kl. 1: Basisfall!
%                                            D2 = []
%
% Rueckweg (Variablen sind jetzt gebunden):
%
%   D2 = []
%   D1 = [c | D2] = [c]
%   D  = [a | D1] = [a,c]
%
% Ergebnis:  D = [a,c].
% =========================================================
