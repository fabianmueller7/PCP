:- use_module(library(http/http_client)).
:- use_module(library(http/http_json)).

% ---------------------------------------------------------
% Gemeinsame HTTP/JSON-Logik fuer den PCP Problem-Provider
% (http://localhost:16316) -- wird von relationship_solver.pl
% und sudoku_solver.pl gleichermassen genutzt.
% ---------------------------------------------------------

% fetch_problem(+Type, +Id, -Fields)
%   Holt die Problem-Instanz Type/Id per HTTP GET.
%   Fields ist die Name=Value-Liste des JSON-Objekts
%   json(Fields), das der Server zurueckliefert.
fetch_problem(Type, Id, Fields) :-
    format(atom(Url), 'http://localhost:16316/problem/~w/~w', [Type, Id]),
    http_get(Url, json(Fields), []).

% post_solution(+Type, +FieldsList)
%   Schickt die Loesung (als Name=Value-Liste) per HTTP POST
%   an den Problem-Provider zurueck. Doppeltes json(json(...))
%   noetig, da der Body ein JSON-Objekt (kein Array) ist.
post_solution(Type, FieldsList) :-
    format(atom(Url), 'http://localhost:16316/problem/~w', [Type]),
    http_post(Url, json(json(FieldsList)), _Reply, []).
