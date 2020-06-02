preguntas([
    "¿Su personaje es hombre o mujer?", 
    "¿De qué color tiene el cabello su personaje?",
    "¿A qué se dedica su personaje?",
    "¿En cuál provincia nació su personaje?",
    "¿Cuántos años tiene su personaje?"])

personajes([
    [[nombre, "Paola Villegas"],
    [edad, "22"],
    [lugar_nacimiento, "Heredia"],
    [color_cabello, "Rubio"],
    [estatura, "1,54"],
    [profesion, "Programadora"]],

    [[nombre, "María Chacón"],
    [edad, "25"],
    [lugar_nacimiento, "Heredia+"],
    [color_cabello, "Café"],
    [estatura, "1,54"],
    [profesion, "CEO"]],
    
    [[nombre, "Keyla Sánchez"],
    [edad, "28"],
    [lugar_nacimiento, "San Ramón"],
    [color_cabello, "Café"],
    [estatura, "1,74"],
    [profesion, "Presentadora"]]]).

copiar(X, X).

tiene_atributo([Atr_P | _Resto], Atr, Valor) :-
    copiar(Atr_P, [Atr | [Valor | _Vacio]]).

tiene_atributo([_ | T], Atr, Valor) :-
    tiene_atributo(T, Atr, Valor).

buscar_con_atr(Personaje, [], Personaje).

buscar_con_atr(Personaje, [P | Resto], Resultado) :-
    copiar(P, [Propiedad | V]),
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

