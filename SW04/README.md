# SW04 – Ausführungsbefehle

## Aufgabe 1: Fibonacci-Zahlen berechnen mit CLP-R
```
swipl SW04/Aufgabe01/fib_clp.pl
```
```
?- fib_clp(10, F).              % vorwärts: F = 55.0
?- fib_clp(X, 8).                % rückwärts, dann ";" drücken -> hängt!
```

Fix (CLP(FD) `fib_clpfd.pl`:
```
swipl SW04/Aufgabe01/fib_clpfd.pl
```
```
?- fib_clpfd(X, 8), fail.       % X = 6, "false"
?- fib_clpfd(X, 7).              % "false" (7 ist keine Fibonacci-Zahl)
```

## Aufgabe 2: Mengen-Differenz (Negation)
```
swipl SW04/Aufgabe02/Mengen_Differenz.pl
```
```
?- set_difference([a, b, c, d], [b, d, e, f], [a, c]).
?- set_difference([1, 2, 3, 4, 5, 6], [2, 4, 6], L).
```

## Aufgabe 3: CLP-Rätsel

### a) Mutter/Tochter-Altersrätsel
```
swipl SW04/Aufgabe03/Altersraetsel.pl
```
```
?- alter(Jahre).                % Jahre = 15
```

### b) DONALD + GERALD = ROBERT
```
swipl SW04/Aufgabe03/Donald_Gerald_Robert.pl
```
```
?- raetsel([D,O,N,A,L,G,E,R,B,T]).
```

## Aufgabe 4: Familiäre Beziehungen & Sudoku via HTTP/JSON

Voraussetzung: PCP Problem-Provider lokal gestartet (`java -jar pcp-problem-provider25.jar`),
erreichbar unter `http://localhost:16316`.

```
swipl SW04/Aufgabe04/solve.pl
```
```
?- solve(relationship, 326).
?- solve(sudoku, 140).
```