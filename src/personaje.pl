/*
["Keyla Sánchez" 
    [Edad, 28], 
    [LugarNacimiento, "San Ramón"], 
    [ColorCabello, cafe], 
    [Estatura, 1.64], 
    [Profesion, boxeadora]]
*/
test(["Keyla Sánchez", 
    [edad, 28], 
    [lugar_nacimiento, "San Ramón"], 
    [color_cabello, "Café"], 
    [estatura, 1.64], 
    [profesion, boxeadora]]).
/*
operaciones([personaje]).

personaje(keyla).
nombre(keyla, "Keyla Sánchez").
genero(keyla, femenino).
nacimiento(keyla, 1992).
edad(keyla, 28).
color_cabello(keyla, cafe_claro).
*/

personaje([]) :-
    nombre([]),
    edad().

nombre([H | T]) :-
    nombre(T).

