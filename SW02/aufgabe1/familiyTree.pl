% all females
female(mary). female(liz). female(mia). female(tina). female(ann). female(sue).
% all males
male(mike). male(jack). male(fred). male(tom). male(joe). male(jim).

parent(mary, mia). parent(mary, fred). parent(mary, tina). % all children of mary
parent(mike, mia). parent(mike, fred). parent(mike, tina). % all children of mike
parent(liz, tom). parent(liz, joe).                        % all children of liz
parent(jack, tom). parent(jack, joe).                       % all children of jack
parent(mia, ann).                                           % all children of mia
parent(tina, sue). parent(tina, jim).                       % all children of tina
parent(tom, sue). parent(tom, jim).                         % all children of tom

% a) mother/2, father/2
mother(X, Y) :- parent(X, Y), female(X).
father(X, Y) :- parent(X, Y), male(X).

% b) sibling/2 (Person is her own sibling too, see Hinweis 1)
sibling(X, Y) :- parent(P, X), parent(P, Y).

% c) grandmother/2
grandmother(X, Y) :- parent(X, Z), parent(Z, Y), female(X).

% d) offspring/2 (transitive closure of parent/2, mirrored)
offspring(X, Y) :- parent(Y, X).
offspring(X, Y) :- parent(Z, X), offspring(Z, Y).
