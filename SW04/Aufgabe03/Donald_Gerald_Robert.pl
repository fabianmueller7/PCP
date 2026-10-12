:- use_module(library(clpfd)).

% ---------------------------------------------------------
% Rätsel(Digits) -- Raetsel b), analog zu SEND + MORE = MONEY:
%
%      D O N A L D
%    + G E R A L D
%    -----------
%      R O B E R T
%
% ---------------------------------------------------------

raetsel(Digits) :-
    Digits = [D, O, N, A, L, G, E, R, B, T],
    Digits ins 0..9,
    all_different(Digits),
    D #\= 0,
    G #\= 0,
    R #\= 0,
             100000*D + 10000*O + 1000*N + 100*A + 10*L + D
           + 100000*G + 10000*E + 1000*R + 100*A + 10*L + D
          #= 100000*R + 10000*O + 1000*B + 100*E + 10*R + T,
    label(Digits).


