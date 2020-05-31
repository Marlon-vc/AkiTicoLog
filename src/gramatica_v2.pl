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

oracion(S0, S):- 
    sintagma_nominal(_Gen, Num, S0, S1),
    sintagma_verbal(Num, S1, S).

sintagma_nominal(Gen, Num, S0, S):- 
    determinante(Gen, Num, S0, S1),
    nombre(Gen, Num, S1, S).

sintagma_verbal(Num, S0, S):- 
    verbo(Num, S0, S).

sintagma_verbal(Num, S0, S):- 
    verbo(Num, S0, S1),
    sintagma_nominal(_Gen, Num, S1, S).

determinante(m, sg, [el| S], S).
determinante(f, sg, [la| S], S).

nombre(m, sg, [hombre | S], S).
nombre(f, sg, [manzana | S], S).

%nombre(f, sg, [_ | S], S).
%nombre(_, sg, [personaje | S], S).
%adjetivo(_, sg, [mi | S], S).

verbo(sg, [come | S], S).
verbo(sg, [guarda | S], S).


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

