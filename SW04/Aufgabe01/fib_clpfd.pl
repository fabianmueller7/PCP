:- use_module(library(clpfd)).

% ---------------------------------------------------------
% fib_clpfd(N, F) -- "Fix" für Aufgabe 1c):
%   Statt CLP(R) wird CLP(FD) verwendet, UND N wird explizit
%   auf eine endliche Domain beschränkt (hier 0..15). Erst
%   dadurch wird der Suchraum endlich und die Anfrage
%   terminiert auch bei Backtracking bzw. bei Nicht-Fibonacci-
%   Zahlen sauber mit "false".
%
%   Ohne das "N in 0..15" würde auch diese Version genau
%   gleich hängen wie fib_clp/2 in fib_clp.pl!
%
%   Hinweis: Die Schranke muss klein bleiben, weil die
%   rekursive Definition NICHT memoisiert ist. Pro Aufruf
%   verzweigt sie in 2 weitere Aufrufe, der Aufwand wächst
%   also exponentiell mit N (unabhängig vom CLP-Problem).
%   Schon N in 0..30 macht z.B. die Suche nach "keine weitere
%   Lösung" spürbar langsam.
% ---------------------------------------------------------

fib_clpfd(N, F) :- N in 0..15, N #= 0, F #= 0.
fib_clpfd(N, F) :- N in 0..15, N #= 1, F #= 1.
fib_clpfd(N, F) :-
    N in 0..15,
    N #> 1,
    N1 #= N - 1,
    N2 #= N - 2,
    fib_clpfd(N1, F1),
    fib_clpfd(N2, F2),
    F #= F1 + F2.
