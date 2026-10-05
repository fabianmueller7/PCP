# SW03 – Ausführungsbefehle

Dateipfade bei Aufgabe 2–6 sind Platzhalter (`<datei>.pl`) — anpassen, sobald die Datei existiert.

## Aufgabe 1: Endrekursive Fibonacci-Berechnung (I/O)
```
swipl SW03/Aufgabe01/EndRekursive_Fibonacci_Brechnet.pl
```
```
?- io_fib.
```

## Aufgabe 2: Memoization der Fakultät
```
swipl SW03/Aufgabe02/Memoization_Fakultaet.pl
```

```
?- fak(7, N).
?- fak(7, N).
?- fak(8, N).
?- fak_clear.
```

## Aufgabe 3: Listen-Operationen
```
swipl SW03/Aufgabe3/Listen_Operationen.pl
```
```
?- add_tail(x, [a, b, c], L).
?- del([a, b, c, a, d, a], a, L).
?- mem_d(a, [a, b, c]).
?- rev_acc([a, b, c, d], [], L).
?- rev([a, b, c, d], L).
```

## Aufgabe 4: Suchbaum mit/ohne Cut (p/1)
```
swipl SW03/Aufgabe04/<datei>.pl
```
```
?- trace.
?- p(X).
```

## Aufgabe 5: Green Cut – warn/1 umschreiben
```
swipl SW03/Aufgabe5/Green_Cut_Warn.pl
```
```
?- warn(70).
?- warn(90).
?- warn(150).
```
Hinweis: Datei enthält aktuell nur das gegebene Original-Prädikat (mit Cut). Die Aufgabe ist, `warn/1` ohne Cut umzuschreiben, aber mit identischer Ausgabe.

## Aufgabe 6: Red Cut – Permutationen einschränken
```
swipl SW03/Aufgabe6/Red_Cut_Permutationen.pl
```
```
?- perm_abc(L).
```
Hinweis: Datei enthält aktuell nur die gegebene Original-Anfrage (ohne Cut, erzeugt alle 6 Permutationen). Aufgabe: Cut an geeigneter Stelle einfügen, sodass nur eine Permutation erzeugt wird.
