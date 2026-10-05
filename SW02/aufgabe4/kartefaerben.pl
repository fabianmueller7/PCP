% Zwei Farben sind "nachbarvertraeglich", wenn sie unterschiedlich sind.
n(gelb, rot).   n(gelb, gruen).
n(rot, gelb).   n(rot, gruen).
n(gruen, gelb). n(gruen, rot).

% Nachbarschaften der sechs Zentralschweizer Kantone:
%   LU - NW, OW, SZ, ZG
%   NW - LU, OW, SZ, UR
%   OW - LU, NW, UR
%   SZ - LU, NW, UR, ZG
%   UR - NW, OW, SZ
%   ZG - LU, SZ
%
% UR ist vorgegeben gelb, SZ ist vorgegeben rot. Jede Kante wird nur einmal
% geprueft (nur gegen bereits eingefuehrte Kantone), analog zum Beispiel im
% Unterricht.

kantone(UR, SZ, NW, OW, LU, ZG) :-
    UR = gelb,
    SZ = rot,
    n(UR, NW), n(SZ, NW),   % Nachbarn von NW: UR, SZ
    n(UR, OW), n(NW, OW),   % Nachbarn von OW: UR, NW
    n(NW, LU), n(OW, LU), n(SZ, LU),   % Nachbarn von LU: NW, OW, SZ
    n(LU, ZG), n(SZ, ZG).   % Nachbarn von ZG: LU, SZ
