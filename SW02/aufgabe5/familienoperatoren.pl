% Basiert auf den Fakten und Regeln aus Aufgabe 1 (mother/2, offspring/2).
:- consult('../aufgabe1/familiyTree.pl').

% a) xfx-Operator fuer mother/2: "liz mother X" wird zu mother(liz, X).
:- op(700, xfx, mother).

% b) xfx-Operator fuer offspring/2: "ann offspring mike" wird zu offspring(ann, mike).
:- op(700, xfx, offspring).
