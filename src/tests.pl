personajes([
    [[nombre, "A"],
    [edad, "18"],
    [genero, "Mujer"],
    [nacimiento, "1998"],
    [lugar_nacimiento, "L1"],
    [color_cabello, "Rojo"],
    [estatura, "1,62"],
    [profesion, "P1"]],

    [[nombre, "B"],
    [edad, "21"],
    [genero, "Hombre"],
    [nacimiento, "1999"],
    [lugar_nacimiento, "L2"],
    [color_cabello, "Verde"],
    [estatura, "1,75"],
    [profesion, "P2"]],
    
    [[nombre, "C"],
    [edad, "28"],
    [genero, "Mujer"],
    [nacimiento, "1992"],
    [lugar_nacimiento, "L3"],
    [color_cabello, "Negro"],
    [estatura, "1,74"],
    [profesion, "P3"]],
    
    [[nombre, "D"],
    [edad, "15"],
    [genero, "Mujer"],
    [nacimiento, "1992"],
    [lugar_nacimiento, "L4"],
    [color_cabello, "Azul"],
    [estatura, "1,74"],
    [profesion, "P4"]]]).


has_attribute([Prop | _], Prop).

has_attribute([_ | T], Prop) :-
    has_attribute(T, Prop).

has_attributes(_, []).
has_attributes(Character, [Prop | T]) :-
    has_attribute(Character, Prop),
    has_attributes(Character, T).

buscar_personaje([Character | _], Props, R) :-
    has_attributes(Character, Props),
    Character = R.

buscar_personaje([_ | C], Props, R) :-
    buscar_personaje(C, Props, R).

buscar(Props, R) :-
    personajes(X),
    Props \= [],
    buscar_personaje(X, Props, R).

coincidencias(Props, C) :-
    aggregate_all(count, buscar(Props, _), C).