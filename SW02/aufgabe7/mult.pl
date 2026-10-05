% a) Multiplikation durch wiederholte Addition.
mult(_, 0, 0).
mult(0, _, 0).
mult(X, Y, Z) :-
    Y > 0,
    Y1 is Y - 1,
    mult(X, Y1, Z1),
    Z is Z1 + X.

% b) Ohne die Bedingung "Y > 0" passt die dritte Klausel auch dann noch,
% wenn Y bereits 0 ist. Bei Backtracking (z.B. nach mult(3,4,X) wiederholt
% ";" druecken) versucht Prolog dann diese Klausel erneut, Y wird zu -1,
% -2, -3, ... immer weiter dekrementiert und die Rekursion terminiert nie
% -> "Out of local stack". Die Bedingung Y > 0 verhindert das: Sobald Y=0
% erreicht ist, schlaegt die dritte Klausel beim Backtracking sofort fehl,
% anstatt weiter zu rekursieren.
