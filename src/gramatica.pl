oracion(S0, S) :-
    adjetivo(_Gen, Num, S0, S1),
    nombre(_Gen, Num, S1, S2).



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

adjetivo(_, sg, [mi | S], S).

nombre(m, sg, [hombre | S], S).
nombre(f, sg, [manzana | S], S).
nombre(f, sg, [_ | S], S).
nombre(_, sg, [personaje | S], S).

verbo(sg, [come | S], S).
verbo(sg, [guarda | S], S).
