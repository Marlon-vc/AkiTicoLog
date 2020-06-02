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

    [[nombre, "Paola Villegas"],
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

% get_attribute(Personaje, Atributo, Valor_atributo). 
get_attribute([Atr | _], Atributo, Val):-
    get_attribute_aux(Atr, [Atributo | V]),
    get_attribute_aux(V, [Val | _]).

get_attribute([_ | T], Atr, Val) :-
    get_attribute(T, Atr, Val).

get_attribute_aux(A, A).

/*
find_personaje(Attr, R) :-
    personajes(X),
    find_personaje(X, Attr, R).

find_personaje([Personaje | _], [Propiedad | V], Resultado) :-
    get_attribute_aux(V, [Valor | _]),
    get_attribute(Personaje, Propiedad, Valor),
    Personaje = Resultado.

find_personaje([_ | Resto], Attr, Resultado) :-
    find_personaje(Resto, Attr, Resultado).
*/

buscar_personaje(Personaje, [], Personaje).

buscar_personaje(Personaje, [[Prop | V] | R], Coincidencia) :-
    %get_attribute_aux(Q, [Prop | V]),
    get_attribute_aux(V, [Value | _]),
    get_attribute(Personaje, Prop, Value),
    buscar_personaje(Personaje, R, Coincidencia).
    %Personaje = Coincidencia.

buscar_personaje(_, _, _) :-
    fail.

/*
buscar_personaje(Personaje, [_ | Queries], Coincidencia) :-
    buscar_personaje(Personaje, Queries, Coincidencia).
*/

/*
find_personaje_plus([Query | _], R) :-
    find_personaje(Query, S).
*/

buscar([Personaje | _], Q, R) :-
    buscar_personaje(Personaje, Q, R).

buscar([_ | Resto], Q, R) :-
    buscar(Resto, Q, R).

buscar_definitivo(Q, R) :-
    personajes(X),
    buscar(X, Q, R).


coincidencias_busqueda(Queries, Count) :-
    aggregate_all(count, buscar_definitivo(Queries, _), Count).
    

get_coincidences(Q, C) :-
    aggregate_all(count, find_personaje(Q, _), C).