:- use_module(library(clpfd)).

% ---------------------------------------------------------
% sudoku(Rows) / blocks(Z1,Z2,Z3) -- aus Prolog 6, Folie 5+14
%   1:1 uebernommener CLP(FD)-Sudoku-Loeser.
% ---------------------------------------------------------

sudoku(Rows) :-
    append(Rows, Vs), Vs ins 1..9,
    maplist(all_distinct, Rows),
    transpose(Rows, Columns),
    maplist(all_distinct, Columns),
    Rows = [A, B, C, D, E, F, G, H, I],
    blocks(A, B, C), blocks(D, E, F), blocks(G, H, I),
    maplist(label, Rows).

blocks([], [], []).
blocks([J, K, L | Bs1], [M, N, O | Bs2], [P, Q, R | Bs3]) :-
    all_distinct([J, K, L, M, N, O, P, Q, R]),
    blocks(Bs1, Bs2, Bs3).

% ---------------------------------------------------------
% replace_0(L, L1) -- ersetzt in L jedes 0 durch die anonyme
%   Variable _ (sudoku/1 erwartet freie Felder als Variable,
%   der Problem-Provider liefert aber 0, siehe Folie 46)
% ---------------------------------------------------------

replace_0([], []).
replace_0([0 | T], [_ | T1]) :-
    replace_0(T, T1).
replace_0([H | T], [H | T1]) :-
    H \= 0,
    replace_0(T, T1).

% ---------------------------------------------------------
% solve_sudoku(+Id)
%   Holt die Sudoku-Problem-Instanz Id, loest sie und
%   schickt die Loesung zurueck.
% ---------------------------------------------------------

solve_sudoku(Id) :-
    fetch_problem(sudoku, Id, Fields),
    memberchk(sudoku=RowsWithZeros, Fields),           % RowsWithZeros = 9x9-Liste von Listen aus dem JSON, freie Felder als 0
    maplist(replace_0, RowsWithZeros, Rows),            % wendet replace_0/2 auf jede der 9 Zeilen an -> Rows mit _ statt 0
    sudoku(Rows),
    post_solution(sudoku, [id=Id, solution=Rows]).
