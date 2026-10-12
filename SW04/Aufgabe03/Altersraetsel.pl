:- use_module(library(clpfd)).

% ---------------------------------------------------------
% alter(Jahre) -- Raetsel a):
%   "Die Tochter ist 15 Jahre alt, die Mutter dreimal so
%   alt. In wie vielen Jahren wird die Mutter nur noch
%   doppelt so alt sein wie ihre Tochter?"
% ---------------------------------------------------------

alter(Jahre) :-
    TochterHeute = 15,
    MutterHeute #= 3 * TochterHeute,
    MutterHeute + Jahre #= 2 * (TochterHeute + Jahre),
    label([Jahre]).

