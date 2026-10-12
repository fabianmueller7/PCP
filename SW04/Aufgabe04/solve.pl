:- consult('http_problem_client.pl').
:- consult('relationship_solver.pl').
:- consult('sudoku_solver.pl').

% ---------------------------------------------------------
% solve(+Type, +Id)
%   Einstiegspunkt: Type = relationship oder sudoku.
%   Beispiel: ?- solve(relationship, 326).
%             ?- solve(sudoku, 140).
% ---------------------------------------------------------

solve(relationship, Id) :- solve_relationship(Id).
solve(sudoku, Id)       :- solve_sudoku(Id).
