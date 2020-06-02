show_question([]).
show_question([Q | R]):-
    write(Q), nl, read(_Ans),
    show_question(R).

akiTicoLog:-show_question(["¿Su personaje es hombre o mujer?", 
    "¿De qué color tiene el cabello su personaje?",
    "¿A qué se dedica su personaje?",
    "¿En cuál provincia nació su personaje?",
    "¿Cuántos años tiene su personaje?"]).
    