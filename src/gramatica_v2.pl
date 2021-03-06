/**
 * Reglas básicas de la gramática del programa.
 * CAMBIAR POR GRAMATICA ACTUAL
*/

% oracion ([palabra, palabra], []).

oracion(S0, S, Q0, Q):- 
    sintagma_nominal(_Gen, Num, S0, S1, Q0, Q1),
    sintagma_verbal(Num, S1, S, Q1, Q), !.

oracion(S0, S, Q0, Q):- 
    sintagma_verbal(_Num, S0, S, Q0, Q), !.

oracion(S0, S, Q0, Q):- 
    sujeto(S0, S1),
    sintagma_verbal(_Num, S1, S, Q0, Q), !.

/*
Reglas para sintagma nominal
*/

sintagma_nominal(_Gen, Num, S0, S, Q0, Q):-
    nucleo_s_n(Num, S0, S, Q0, Q).

sintagma_nominal(_Gen, Num, S0, S, Q0, Q):-
    nucleo_s_n(Num, S0, S1, Q0, Q1),
    nucleo_s_n(Num, S1, S, Q1, Q).

sintagma_nominal(Gen, Num, S0, S, Q0, Q):-
    nucleo_s_n(Num, S0, S1, Q0, Q1),
    sintagma_adjetival(Gen, Num, S1, S, Q1, Q).

sintagma_nominal(Gen, Num, S0, S, Q0, Q):-
    determinante(Gen, Num, S0, S1, Q0, Q1),
    nucleo_s_n(Num, S1, S, Q1, Q).

sintagma_nominal(_Gen, Num, S0, S, Q0, Q):-
    nucleo_s_n(Num, S0, S1, Q0, Q1),
    enlace_s_p(S1, S2),
    nucleo_s_n(Num, S2, S, Q1, Q).

sintagma_nominal(Gen, Num, S0, S, Q0, Q):-
    determinante(Gen, Num, S0, S1, Q0, Q1),
    nucleo_s_n(Num, S1, S2, Q1, Q2),
    sintagma_adjetival(Gen, Num, S2, S, Q2, Q).

sintagma_nominal(Gen, Num, S0, S, Q0, Q):-
    determinante(Gen, Num, S0, S1, Q0, Q1),
    nucleo_s_n(Num, S1, S2, Q1, Q2),
    sintagma_preposicional(Gen, Num, S2, S3, Q2, Q3),
    nexo(S3, S4),
    sintagma_adjetival(Gen, Num, S4, S, Q3, Q).


/*
Reglas para sintagma preposicional
*/

sintagma_preposicional(Gen, Num, S0, S, Q0, Q):-
    enlace_s_p(S0, S1),
    sintagma_nominal(Gen, Num, S1, S, Q0, Q).

/*
Reglas para sintagma adjetival
*/

sintagma_adjetival(_Gen, Num, S0, S, Q0, Q):-
    nucleo_s_a(Num, S0, S, Q0, Q).

sintagma_adjetival(_Gen, Num, S0, S, Q0, Q):-
    nucleo_s_a(Num, S0, S1, Q0, Q1),
    nucleo_s_a(Num, S1, S, Q1, Q).

/*
Reglas para sintagma verbal
*/
sintagma_verbal(Num, S0, S, Q0, Q):-
    nucleo_s_v(Num, S0, S1),
    sintagma_nominal(_Gen, Num, S1, S, Q0, Q).

sintagma_verbal(Num, S0, S, Q0, Q):-
    nucleo_s_v(Num, S0, S1),
    sintagma_preposicional(_Gen, Num, S1, S, Q0, Q).

sintagma_verbal(Num, S0, S, Q0, Q):-
    nucleo_s_v(Num, S0, S1),
    nucleo_s_v(Num, S1, S2),
    sintagma_preposicional(_Gen, Num, S2, S, Q0, Q).

 
/*
Determinantes del sintagma nominal
*/
determinante(m, sg, [el| S], S, Q, Q).
determinante(f, sg, [la| S], S, Q, Q).
determinante(f, sg, [una | S], S, Q, Q).
determinante(f, sg, [mi | S], S, Q, Q).
determinante(f, sg, [los | S], S, Q, Q).
determinante(_, sg, [28 | S], S, Q, [[edad, "28"] | Q]). 
determinante(_, sg, [41 | S], S, Q, [[edad, "41"] | Q]).
determinante(_, sg, [39 | S], S, Q, [[edad, "39"] | Q]).
determinante(_, sg, [46 | S], S, Q, [[edad, "46"] | Q]).
determinante(_, sg, [34 | S], S, Q, [[edad, "34"] | Q]).
determinante(_, sg, [35 | S], S, Q, [[edad, "35"] | Q]).
determinante(_, sg, [30 | S], S, Q, [[edad, "30"] | Q]).
determinante(_, sg, [26 | S], S, Q, [[edad, "26"] | Q]).

/*
Nucleos del sintagma nominal
*/
nucleo_s_n(sg, [ella | S], S, Q, Q).
nucleo_s_n(sg, [el | S], S, Q, Q).
nucleo_s_n(sg, [cabello | S], S, Q, Q).
nucleo_s_n(sg, [pelo | S], S, Q, Q).
nucleo_s_n(sg, [personaje | S], S, Q, Q).
nucleo_s_n(sg, [deportes | S], S, Q, Q).
nucleo_s_n(sg, [deportista | S], S, Q, Q).
nucleo_s_n(sg, [programar | S], S, Q, Q).
nucleo_s_n(sg, [presentador | S], S, Q, Q).
nucleo_s_n(sg, [presentadora | S], S, Q, Q).
nucleo_s_n(sg, [radio | S], S, Q, Q).
nucleo_s_n(sg, [tv | S], S, Q, Q).
nucleo_s_n(sg, [television | S], S, Q, Q).
nucleo_s_n(sg, [años | S], S, Q, Q).
nucleo_s_n(sg, [1992 | S], S, Q, [[nacimiento, "1992"] | Q]). 
nucleo_s_n(sg, [1990 | S], S, Q, [[nacimiento, "1990"] | Q]).
nucleo_s_n(sg, [1993 | S], S, Q, [[nacimiento, "1993"] | Q]).
nucleo_s_n(sg, [1989 | S], S, Q, [[nacimiento, "1989"] | Q]).
nucleo_s_n(sg, [1985 | S], S, Q, [[nacimiento, "1985"] | Q]).
nucleo_s_n(sg, [1986 | S], S, Q, [[nacimiento, "1983"] | Q]).
nucleo_s_n(sg, [1973 | S], S, Q, [[nacimiento, "1973"] | Q]).
nucleo_s_n(sg, [1980 | S], S, Q, [[nacimiento, "1980"] | Q]).
nucleo_s_n(sg, [1979 | S], S, Q, [[nacimiento, "1979"] | Q]).
nucleo_s_n(sg, [mujer | S], S, Q, [[genero, "Mujer"] | Q]).
nucleo_s_n(sg, [hombre | S], S, Q, [[genero, "Hombre"] | Q]).
nucleo_s_n(sg, [comediante | S], S, Q, [[profesion, "Comediante"] | Q]).
nucleo_s_n(sg, [modelo | S], S, Q, [[profesion, "Modelo"] | Q]).
nucleo_s_n(sg, [futbolista | S], S, Q, [[profesion, "Futbolista"] | Q]).
nucleo_s_n(sg, [periodista | S], S, Q, [[profesion, "Periodista"] | Q]).
nucleo_s_n(sg, [alajuela | S], S, Q, [[lugar_nacimiento, "Alajuela"] | Q]).
nucleo_s_n(sg, [heredia | S], S, Q, [[lugar_nacimiento, "Heredia"] | Q]).
nucleo_s_n(sg, [san | S], S, Q, Q).
nucleo_s_n(sg, [jose | S], S, Q, [[lugar_nacimiento, "San Jose"] | Q]).
nucleo_s_n(sg, [puntarenas | S], S, Q, [[lugar_nacimiento, "Puntarenas"] | Q]).
nucleo_s_n(sg, [ramon | S], S, Q, [[lugar_nacimiento, "San Ramon"] | Q]).
nucleo_s_n(sg, [colombia | S], S, Q, [[lugar_nacimiento, "Colombia"] | Q]).

/*
Nucleos del sintagma verbal
*/

nucleo_s_v(sg, [es | S], S).
nucleo_s_v(sg, [tiene | S], S).
nucleo_s_v(sg, [se | S], S).
nucleo_s_v(sg, [dedica | S], S). 
nucleo_s_v(sg, [nacio | S], S).

/*
Nucleos del sintagma adjetival
*/

nucleo_s_a(sg, [negro | S], S, Q, [[color_cabello, "Negro"] | Q]).
nucleo_s_a(sg, [rubio | S], S, Q, [[color_cabello, "Rubio"] | Q]).
nucleo_s_a(sg, [cafe | S], S, Q, Q).
nucleo_s_a(sg, [claro | S], S, Q, [[color_cabello, "Cafe claro"] | Q]).
nucleo_s_a(sg, [oscuro | S], S, Q, [[color_cabello, "Cafe oscuro"] | Q]).
nucleo_s_a(sg, [alta | S], S, Q, Q).

/*
Enlaces del sintagma preposicional
*/

enlace_s_p([de | S], S).
enlace_s_p([en | S], S).
enlace_s_p([a | S], S).
enlace_s_p([al | S], S).

/*
Nexos
*/

nexo([y | S], S).

/*
Sujetos
*/

sujeto([el | S], S).
sujeto([ella | S], S).
