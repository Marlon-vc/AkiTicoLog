preguntas(
    [
        "Su personaje es hombre o mujer?",
        "Su personaje practica algún deporte?",
        "Su personaje tiene pelo largo?"
    ]).


to_list(X, [X]).


main([]) :-
    write("Su personaje es _.").

main([H | T]) :-
    P = H,
    write(P),
    nl,
    read(R),
    to_list(R, A),
    phrase(o, A),
    main(T).

akiTicoLog :-
    preguntas(P),
    main(P).


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
    
