% Wortliste: ein Fakt pro Wort, jeder Buchstabe ein eigenes Argument.
% 3 Buchstaben
word(n,e,u).
word(t,o,p).
word(t,o,t).
% 4 Buchstaben
word(b,r,o,t).
word(g,r,a,u).
word(h,a,l,t).
word(a,l,l,e).
% 5 Buchstaben
word(j,e,t,z,t).
word(s,a,g,e,n).
word(u,n,t,e,n).
word(z,e,c,k,e).

% Gitter (4 Zeilen x 6 Spalten), # = gesperrtes Feld, Li = freie Zelle/Variable:
%
%      C1  C2  C3  C4  C5  C6
% R1:  #   L1  #   #   #   #
% R2:  L2  L3  L4  L5  #   #
% R3:  #   L6  #   L7  #   #
% R4:  #   L8  L9  L10 L11 L12
%
% H1 = Zeile 2, Spalten 1-4  (L2,L3,L4,L5)        4 Buchstaben
% H2 = Zeile 4, Spalten 2-6  (L8,L9,L10,L11,L12)  5 Buchstaben
% V1 = Spalte 2, Zeilen 1-4  (L1,L3,L6,L8)        4 Buchstaben
% V2 = Spalte 4, Zeilen 2-4  (L5,L7,L10)          3 Buchstaben

crossword(L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12) :-
    word(L2,L3,L4,L5),
    word(L8,L9,L10,L11,L12),
    word(L1,L3,L6,L8),
    word(L5,L7,L10).
