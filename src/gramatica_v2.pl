/* Reglas iniciales
% REGLAS
o            --> sn(_Gen2, Num), sv(Num).
o            --> n(_Gen, _Num).
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

n(m, sg)    --> [hombre].
n(f, sg)    --> [mujer].
*/


/**
 * Reglas básicas de la gramática del programa.
 * CAMBIAR POR GRAMATICA ACTUAL
*/

% oracion ([palabra, palabra], []).
oracion(S0, S):- 
    sintagma_nominal(_Gen, Num, S0, S1),
    sintagma_verbal(Num, S1, S).

oracion(S0, S):- 
    sintagma_verbal(_Num, S0, S).

oracion(S0, S):- 
    sujeto(S0, S1),
    sintagma_verbal(_Num, S1, S).
/*
sintagma_nominal(Gen, Num, S0, S):- 
    determinante(Gen, Num, S0, S1),
    nombre(Gen, Num, S1, S).
*/

sintagma_nominal(_Gen, Num, S0, S):-
    nucleo_s_n(Num, S0, S).
   % sintagma_verbal(Num, S1, S).

sintagma_nominal(Gen, Num, S0, S):-
    determinante(Gen, Num, S0, S1),
    nucleo_s_n(Num, S1, S2),
    sintagma_preposicional(Gen, Num, S2, S3),
    nexo(S3, S4),
    sintagma_adjetival(Gen, Num, S4, S).

sintagma_nominal(Gen, Num, S0, S):-
    determinante(Gen, Num, S0, S1),
    nucleo_s_n(Num, S1, S2),
    sintagma_adjetival(Gen, Num, S2, S).

sintagma_nominal(Gen, Num, S0, S):-
    nucleo_s_n(Num, S0, S1),
    sintagma_adjetival(Gen, Num, S1, S).

sintagma_nominal(Gen, Num, S0, S):-
    determinante(Gen, Num, S0, S1),
    nucleo_s_n(Num, S1, S).

sintagma_nominal(_Gen, Num, S0, S):-
    nucleo_s_n(Num, S0, S).

sintagma_preposicional(Gen, Num, S0, S):-
    enlace_s_p(S0, S1),
    sintagma_nominal(Gen, Num, S1, S).

sintagma_adjetival(_Gen, Num, S0, S):-
    nucleo_s_a(Num, S0, S).


sintagma_verbal(Num, S0, S):-
    nucleo_s_v(Num, S0, S1),
    sintagma_nominal(_Gen, Num, S1, S).

/*
sintagma_verbal(Num, S0, S):- 
    verbo(Num, S0, S).

sintagma_verbal(Num, S0, S):- 
    verbo(Num, S0, S1),
    sintagma_nominal(_Gen, Num, S1, S).
*/

sintagma_verbal(Num, S0, S):-
    nucleo_s_v(Num, S0, S1),
    sintagma_preposicional(_Gen, Num, S1, S).




determinante(m, sg, [el| S], S).
determinante(f, sg, [la| S], S).
determinante(f, sg, [una | S], S).
determinante(f, sg, [mi | S], S).
determinante(f, sg, [los | S], S).
determinante(f, sg, [35 | S], S). % una edad

/*
nombre(m, sg, [hombre | S], S).
nombre(f, sg, [manzana | S], S).

%nombre(f, sg, [_ | S], S).
%nombre(_, sg, [personaje | S], S).
%adjetivo(_, sg, [mi | S], S).

verbo(sg, [come | S], S).
verbo(sg, [guarda | S], S).
*/
nucleo_s_n(sg, [ella | S], S).
nucleo_s_n(sg, [mujer | S], S).
nucleo_s_n(sg, [cabello | S], S).
nucleo_s_n(sg, [personaje | S], S).
nucleo_s_n(sg, [deportes | S], S).
nucleo_s_n(sg, [deportista | S], S).
nucleo_s_n(sg, [alajuela | S], S).
nucleo_s_n(sg, [años | S], S).
nucleo_s_n(sg, [1998 | S], S). % es un año


nucleo_s_v(sg, [es | S], S).
nucleo_s_v(sg, [tiene | S], S).
nucleo_s_v(sg, ["se dedica" | S], S).  %todo hacer que sea aparte,pero la misma regla
nucleo_s_v(sg, [nacio | S], S).

enlace_s_p([de | S], S).
enlace_s_p([en | S], S).
enlace_s_p([a | S], S).

nucleo_s_a(sg, [negro | S], S).
nucleo_s_a(sg, [alta | S], S).

nexo([y | S], S).

sujeto([el | S], S).
sujeto([ella | S], S).





/**
 * Función para covertir la entrada del usuario a una lista de átomos.
 * @param I: String del usuario.
 * @param R: Lista de átomos.
*/

prepare_input(I, R) :-
    split_string(I, " ", "", L),
    list_to_atoms(L, R).

list_to_atoms(X, R) :-
    list_to_atoms(X, [], R).

list_to_atoms([], L, R) :-
    reverse(L, R).

list_to_atoms([H | T], L2, R) :-
    atom_string(A, H),
    list_to_atoms(T, [A | L2], R).

