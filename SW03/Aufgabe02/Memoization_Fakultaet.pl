:- dynamic fak_as/2.

fak(0, 1).
fak(N, F) :- fak_as(N, F), !,       % Cut verhindert, dass weitere Klauseln ausprobiert werden.
    write('(Hinweis: Fakultät von '), write(N), write(' war gespeichert)'),
    write('N = '), write(F).
fak(N, F) :-
    N > 0,
    N1 is  N - 1,
    fak(N1, F1),            % Falls ein vorheriges Fak schon berechnet wurde, wird es hier aufgerufen.
    F is N * F1,
    asserta(fak_as(N, F)).


fak_clear :- retractall(fak_as(_, _)),
    write('(Hinweis: Alle gespeicherten Werte wurden gelöscht)').



