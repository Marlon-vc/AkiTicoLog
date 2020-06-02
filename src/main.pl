preguntas([
    "¿Su personaje es hombre o mujer?", 
    "¿De qué color tiene el cabello su personaje?",
    "¿A qué se dedica su personaje?",
    "¿En cuál provincia nació su personaje?",
    "¿Cuántos años tiene su personaje?"]).

personajes([
    [[nombre, "Paola Villegas"],
    [edad, "22"],
    [lugar_nacimiento, "Heredia"],
    [color_cabello, "Rubio"],
    [estatura, "1,62"],
    [profesion, "Programadora"]],

    [[nombre, "Marlon Vega"],
    [edad, "21"],
    [lugar_nacimiento, "El Salvador"],
    [color_cabello, "Rubio"],
    [estatura, "1,75"],
    [profesion, "Programador"]],
    
    [[nombre, "Keyla Sánchez"],
    [edad, "28"],
    [lugar_nacimiento, "San Ramón"],
    [color_cabello, "Café"],
    [estatura, "1,74"],
    [profesion, "Presentadora"]]]).


copiar(X, X).

tiene_atributo([Atr_P | _], Atr, Valor) :-
    copiar(Atr_P, [Atr | V]),
    copiar(V, [Valor | _]).

tiene_atributo([_ | T], Atr, Valor) :-
    tiene_atributo(T, Atr, Valor).

buscar_con_atr(Personaje, [], Personaje).

buscar_con_atr(Personaje, [[Propiedad | V ] | Resto], Resultado) :-
    copiar(V, [Valor | _]),
    tiene_atributo(Personaje, Propiedad, Valor),
    buscar_con_atr(Personaje, Resto, Resultado).

buscar_con_atr(_, _, _) :-
    fail.

buscar_personajes([Personaje | _], Q, R) :-
    buscar_con_atr(Personaje, Q, R).

buscar_personajes([_ | Resto], Q, R) :-
    buscar_personajes(Resto , Q, R).

buscar(Q, R) :-
    personajes(X),
    buscar_personajes(X, Q, R).

buscar_coincidencias(Q, C) :-
    aggregate_all(count, buscar(Q, _), C).


o(S0, S, Q0, Q):-  %-
    sn(S0, S1, Q0, Q1), %-
    sv(S1, S, Q1, Q).

sn(S0, S, Q0, Q) :- %-
    det(S0, S1),
    n(S1, S, Q0, Q). %-
/*
sn(S0, S, _, _) :- %-
    det(S0, S1),
    n(S1, S).
*/
sn(S0, S, _, _) :-
    np(S0, S).

sv(S0, S, Q0, Q) :-
    v(S0, S1),
    sn(S1, S, Q0, Q).

sv(S0, S, _, _) :-
    v(S0, S).

det([la | S], S).
n([mujer | S], S, Q, [[sexo, "Mujer"] | Q]).
n([manzana | S], S, Q, [[comida, "Manzana"] | Q]).
np([paola | S], S).
np([ella | S], S).
v([mira | S], S).
v([guarda | S], S).
