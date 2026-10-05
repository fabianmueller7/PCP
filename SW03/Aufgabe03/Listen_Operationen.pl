
% ---------------------------------------------------------
% add_tail(X, L, L1) -- X ans Ende von L anhaengen -> L1
%   X  : einzufuegendes Element   (Input)
%   L  : Original-Liste           (Input)
%   L1 : L mit X am Ende          (Output)
% ---------------------------------------------------------

add_tail(X, [], [X]).                  % simple case: L leer -> L1 = [X]
add_tail(X, [H | T], [H | T1]) :-      % general case: Kopf H bleibt, Rekursion auf Schwanz T
    add_tail(X, T, T1).                % T1 = T mit X am Ende angehaengt


% ---------------------------------------------------------
% del(L, X, L1) -- alle Vorkommen von X aus L entfernen -> L1
%   L  : Original-Liste           (Input)
%   X  : zu loeschendes Element   (Input)
%   L1 : L ohne alle X            (Output)
% ---------------------------------------------------------

del([], _, []).                        % simple case: leere Liste bleibt leer
del([X | T], X, L1) :-                 % Kopf == X -> ueberspringen (nicht in L1 uebernehmen)
    del(T, X, L1).
del([H | T], X, [H | L1]) :-           % Kopf != X -> behalten, rekursiv im Schwanz weiterloeschen
    H \= X,
    del(T, X, L1).


% ---------------------------------------------------------
% mem_d(X, L) -- testet Listenzugehoerigkeit, NUR mit del/3
%   X : gesuchtes Element  (Input)
%   L : Liste              (Input)
% ---------------------------------------------------------

mem_d(X, L) :-                         % X kommt in L vor <=> Loeschen von X veraendert die Liste
    del(L, X, L1),
    L1 \= L.


% ---------------------------------------------------------
% rev_acc(L, A, R) -- L umkehren mit Akkumulator A -> R
%   L : abzuarbeitende (Rest-)Liste         (Input, schrumpft pro Aufruf)
%   A : Akkumulator, baut die Umkehrung auf (Input, startet leer)
%   R : fertige umgekehrte Liste            (Output)
% ---------------------------------------------------------

rev_acc([], A, A).                     % simple case: L leer -> R ist der fertige Akkumulator
rev_acc([H | T], A, R) :-              % general case: H vorne in den Akkumulator schieben
    rev_acc(T, [H | A], R).            % und rekursiv mit Rest T weitermachen


% ---------------------------------------------------------
% rev(L, R) -- Liste L umkehren -> R (nutzt rev_acc/3)
%   L : Original-Liste   (Input)
%   R : umgekehrte Liste (Output)
% ---------------------------------------------------------

rev(L, R) :-
    rev_acc(L, [], R).                 % Start mit leerem Akkumulator
