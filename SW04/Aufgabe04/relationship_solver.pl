:- consult('../../SW02/aufgabe1/familiyTree.pl').

% ---------------------------------------------------------
% solve_relationship(+Id)
%   Holt die Relationship-Problem-Instanz Id, prueft die
%   Beziehung (mother/father/sibling/grandmother/offspring,
%   wiederverwendet aus SW02/aufgabe1/familiyTree.pl) und
%   schickt das Resultat zurueck.
% ---------------------------------------------------------

solve_relationship(Id) :-
    fetch_problem(relationship, Id, Fields),
    memberchk(firstPerson=First, Fields),              % First = Name der ersten Person (Atom, z.B. mike)
    memberchk(relationship=RelAtom, Fields),           % RelAtom = Beziehungs-Praedikatsname als Atom (z.B. parent, offspring, ...)
    memberchk(secondPerson=Second, Fields),            % Second = Name der zweiten Person (Atom, z.B. liz)
    ( catch(call(RelAtom, First, Second), _, fail)     % ruft z.B. parent(mike, liz) indirekt auf; existiert RelAtom/2 nicht, faengt catch den Fehler ab -> fail statt Crash
    -> Result = true
    ;  Result = false
    ),
    post_solution(relationship, [id=Id, solution=Result]).
