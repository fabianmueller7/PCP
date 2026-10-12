
% ---------------------------------------------------------
% add_tail(X, L, L1) -- X ans Ende von L anhaengen -> L1
%   X  : einzufuegendes Element   (Input)
%   L  : Original-Liste           (Input)
%   L1 : L mit X am Ende          (Output)
% ---------------------------------------------------------

add_tail(X, [], [X]).                  % simple case: L leer -> L1 = [X]
add_tail(X, [H | T], [H | T1]) :-      % general case: Kopf H bleibt, Rekursion auf Schwanz T
    add_tail(X, T, T1).                % T1 = T mit X am Ende angehaengt


% =========================================================
% Ablaufskizze fuer:  ?- add_tail(d, [a,b,c], L).
%
% Abstieg (Rekursion geht in die Tiefe):
%
%   add_tail(d, [a,b,c], L)       Kl. 2: H=a, T=[b,c]
%                                 L  = [a | T1]
%   add_tail(d, [b,c],   T1)      Kl. 2: H=b, T=[c]
%                                 T1 = [b | T2]
%   add_tail(d, [c],     T2)      Kl. 2: H=c, T=[]
%                                 T2 = [c | T3]
%   add_tail(d, [],      T3)      Kl. 1: Basisfall!
%                                 T3 = [d]
%
% Rueckweg (Variablen sind jetzt gebunden):
%
%   T3 = [d]
%   T2 = [c | T3] = [c,d]
%   T1 = [b | T2] = [b,c,d]
%   L  = [a | T1] = [a,b,c,d]
%
% Ergebnis:  L = [a,b,c,d].
% =========================================================





% ---------------------------------------------------------
% del(L, X, L1) -- alle Vorkommen von X aus L entfernen -> L1
%   L  : Original-Liste           (Input)
%   X  : zu loeschendes Element   (Input)
%   L1 : L ohne alle X            (Output)
% ---------------------------------------------------------

del([], _, []).                        % simple case: leere Liste bleibt leer
del([X | T], X, L1) :-                 % Kopf == X -> ueberspringen (Da X zweimal im Kopf vorkommt ziwngt es die Elemente gleich sind, und sommit ist ein X ==X überflüssig.);
    del(T, X, L1).
del([H | T], X, [H | L1]) :-           % Kopf != X -> behalten, rekursiv im Schwanz weiterloeschen
    H \= X,
    del(T, X, L1).

% =========================================================
% Ablaufskizze fuer:  ?- del([a,b,a,c], a, L).
%
% Abstieg:
%
%   del([a,b,a,c], a, L)     Kl. 2 passt (Kopf a = X)
%                            -> a weglassen, L wird durchgereicht
%   del([b,a,c],   a, L)     Kl. 2 passt nicht (b /= a)
%                            Kl. 3: H=b, b \= a ok
%                            L  = [b | L1]
%   del([a,c],     a, L1)    Kl. 2 passt (Kopf a = X)
%                            -> a weglassen, L1 durchgereicht
%   del([c],       a, L1)    Kl. 3: H=c, c \= a ok
%                            L1 = [c | L2]
%   del([],        a, L2)    Kl. 1: Basisfall!
%                            L2 = []
%
% Rueckweg:
%
%   L2 = []
%   L1 = [c | L2] = [c]
%   L  = [b | L1] = [b,c]
%
% Ergebnis:  L = [b,c].
% =========================================================



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

rev_acc([], A, A).                     % simple case: L leer -> R ist der fertige Akkumulator. Sobald die Liste leer ist, wird diese Kausel genutzt und das fertige A auf R gebunden.
rev_acc([H | T], A, R) :-              % general case: H vorne in den Akkumulator schieben
    rev_acc(T, [H | A], R).            % und rekursiv mit Rest T weitermachen

% =========================================================
% Ablaufskizze fuer:  ?- rev_acc([a,b,c], [], R).
%
%   Aufruf                         L          A
%   ------------------------------------------------------
%   rev_acc([a,b,c], [],      R)   [a,b,c]    []
%   rev_acc([b,c],   [a],     R)   [b,c]      [a]
%   rev_acc([c],     [b,a],   R)   [c]        [b,a]
%   rev_acc([],      [c,b,a], R)   []         [c,b,a]
%                                  -> Kl. 1: R = [c,b,a]
%
% Rueckweg:
%   Nichts mehr zu tun! R ist schon gebunden und wird
%   einfach durch alle Aufrufe nach oben "durchgereicht".
%
% Ergebnis:  R = [c,b,a].
% =========================================================




% ---------------------------------------------------------
% rev(L, R) -- Liste L umkehren -> R (nutzt rev_acc/3)
%   L : Original-Liste   (Input)
%   R : umgekehrte Liste (Output)
% ---------------------------------------------------------

rev(L, R) :-
    rev_acc(L, [], R).                 % Start mit leerem Akkumulator
