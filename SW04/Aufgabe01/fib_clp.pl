:- use_module(library(clpr)).

% ---------------------------------------------------------
% fib_clp(N, F) -- F ist die N-te Fibonacci-Zahl
%   Direkte CLP(R)-Übersetzung der rekursiven Definition
%   (wie in Prolog 5, Folie 34 gezeigt). Weil {}/1-Constraints
%   statt is/2 verwendet werden, kann man das Prädikat auch
%   "rückwärts" aufrufen (F gegeben, N gesucht).
% ---------------------------------------------------------

fib_clp(N, F) :- {N = 0}, {F = 0}.
fib_clp(N, F) :- {N = 1}, {F = 1}.
fib_clp(N, F) :-
    {N > 1},
    {N1 = N - 1},
    {N2 = N - 2},
    fib_clp(N1, F1),
    fib_clp(N2, F2),
    {F = F1 + F2}.


% =========================================================
% a) Wie manifestiert sich das Problem in SWI-Prolog?
%
%   Vorwärts geht alles normal:
%     ?- fib_clp(10, F).
%     F = 55.0.
%
%   Rückwärts mit gültiger Fibonacci-Zahl liefert die
%   erste (korrekte) Lösung ganz normal:
%     ?- fib_clp(X, 8).
%     X = 6.0 ;
%     ... hier hängt SWI-Prolog!
%   Druckt man nach der ersten Antwort ";" (weitere Lösungen
%   gesucht), kommt KEINE Antwort mehr. Die Abfrage hängt
%   scheinbar für immer (getestet mit time_limit: nach 5s
%   immer noch keine Antwort/kein "false").
%
%   Ist die Zahl gar keine Fibonacci-Zahl, tritt dasselbe
%   Problem schon bei der ERSTEN Antwort auf:
%     ?- fib_clp(X, 7).
%     ... hängt sofort, liefert nie "false".
%
%   Zwingt man Prolog (z.B. mit einem künstlich kleinen
%   Stack-Limit) weiterzusuchen, sieht man, dass es sich
%   nicht wirklich um eine Endlosschleife im klassischen
%   Sinn handelt, sondern um eine unbeschränkte Suche: nach
%   einiger Zeit kommt ein
%     resource_error(stack) / stack_overflow
%   Prolog versucht also weiter und weiter neue (immer
%   grössere) Werte für N auszuprobieren, ohne je
%   abzubrechen.
%
% ---------------------------------------------------------
% b) Wieso tritt das Problem auf?
%
%   CLP(R) rechnet über reellen (bzw. rationalen) Zahlen.
%   Die Constraints {N > 1}, {N1 = N-1}, {N2 = N-2} schränken
%   N nur nach UNTEN ein (N > 1), es gibt aber nirgends eine
%   obere Schranke für N.
%
%   Wird fib_clp(X, 8) aufgerufen, ist X zu Beginn frei. Der
%   Beweis für die erste Lösung (X = 6.0) gelingt, weil
%   Prolog links-nach-rechts, Tiefe-zuerst sucht und dabei
%   zufällig/systematisch auf die richtige Kombination
%   stösst. Bei Backtracking (";") verwirft Prolog diese
%   Lösung aber nur lokal und versucht übers 3. Clause
%   erneut, mit einer ANDEREN Belegung von N eine Lösung mit
%   F = 8 zu finden. Da N nach oben nicht beschränkt ist,
%   gibt es unendlich viele "Kandidaten" N = 7, 8, 9, ... für
%   die rekursiv (exponentiell!) neue Teilbäume aufgebaut und
%   auf Konsistenz mit F = 8 geprüft werden müssen, bevor
%   Prolog (falls überhaupt) merkt, dass keine weitere
%   Lösung existiert. Diese Suche terminiert nie, weil es
%   keinerlei Wissen über "Fibonacci-Zahlen wachsen streng
%   monoton" oder eine Abbruchbedingung im Code gibt -- CLP(R)
%   kennt nur die linearen Gleichungen/Ungleichungen, nicht
%   die Semantik "F ist EINDEUTIG (ausser bei N=1/2) durch N
%   bestimmt".
%
%   Bei einer Nicht-Fibonacci-Zahl (z.B. 7) ist es genau
%   dasselbe Problem, nur dass schon die ERSTE Lösung nie
%   gefunden wird: Prolog probiert systematisch immer grössere
%   N durch, ohne je auf eine Kombination zu stossen, die F = 7
%   ergibt, und ohne eine obere Schranke zu haben, ab der es
%   aufgeben könnte.
%
% ---------------------------------------------------------
% c) Lässt sich das Problem einfach beheben?
%
%   Nein, nicht WIRKLICH einfach -- das Problem liegt am
%   gewählten Constraint-Bereich, nicht an einem simplen Bug:
%
%   - Ein Cut (!) nach der ersten gefundenen Lösung würde
%     zwar das Hängen bei "weitere Lösungen suchen"
%     verhindern, ist aber keine saubere Lösung: Für F = 1
%     gibt es tatsächlich ZWEI gültige Antworten (N = 1 und
%     N = 2, da fib(1) = fib(2) = 1) -- ein Cut würde diese
%     zweite, korrekte Lösung verschlucken. Ausserdem löst
%     ein Cut das Problem mit Nicht-Fibonacci-Zahlen gar
%     nicht, da dort schon die erste Lösung nie gefunden wird.
%
%   - Der eigentliche Grund ist: CLP(R) arbeitet über reellen
%     Zahlen OHNE obere Schranke und OHNE Wissen um die
%     Ganzzahligkeit/Monotonie von N. Eine wirkliche Lösung
%     erfordert einen WECHSEL des Constraint-Systems auf
%     CLP(FD) (library(clpfd)) MIT einer expliziten endlichen
%     Domain für N (z.B. N in 0..15) -- siehe
%     fib_clpfd.pl. Erst die Kombination aus (1) Ganzzahl-
%     Constraints und (2) einer konkreten oberen Schranke
%     macht den Suchraum endlich und die Anfrage terminierend.
%     Ohne obere Schranke hängt sogar CLP(FD) genau gleich
%     (getestet: selbes stack_overflow-Verhalten wie bei
%     CLP(R)).
%
%   Kurz: Das ist kein 1-Zeilen-Fix am bestehenden Prädikat,
%   sondern erfordert einen Wechsel des Lösungsansatzes
%   (anderes Constraint-System + explizite Schranke).
% =========================================================
