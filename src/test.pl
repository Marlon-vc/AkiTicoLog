/*

oracion => o
sintagma_nominal => sn
sintagma_verbal => sv
determinante => det
nombre => n
verbo_transitivo => vt
verbo_intransitivo => vi

No terminantes
o, sn, sv

Terminantes
det, n, vt, vi

Reglas
o => sn + sv
sn => det + n
sv => vt + sn
sv => vi

*/

% REGLAS
o            --> sn(_Gen2, Num), sv(Num).
sn(Gen, Num) --> det(Gen, Num),  n(Gen, Num).
sv(Num)      --> vt(Num),        n(_Gen, Num).
sv(Num)      --> vi(Num). 

% TERMINANTES
det(f, sg)  --> [la];   [una].
det(f, pl)  --> [las];  [unas].
det(m, sg)  --> [el];   [un].
det(m, pl)  --> [los];  [unos].
vi(sg)      --> [ladra].
vi(pl)      --> [ladran].
vt(sg)      --> [muerde].
vt(pl)      --> [muerden].
n(f, sg)    --> [perra].
n(f, pl)    --> [perras].
n(m, sg)    --> [perro];    [hueso].
n(m, pl)    --> [perros];   [huesos].

