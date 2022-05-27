:- [gramatica].


%Función miembro que recibe una lista y un elemento y devuelve true si el elemento está en la lista
miembro(X, [X|_]).
miembro(X, [_|Y]):- miembro(X, Y).

%Fucion concatena que recibe dos listas y devuelve una lista con todos los elementos de las dos listas
concatena([], L, L).
concatena([X|L1], L2, [X|L3]):- concatena(L1, L2, L3).

verificarSentidoLogico(L) :- writeln(L),oracion(L, []).
verificarSentidoLogico(L) :- writeln("No entendi la peticion, intenta de nuevo."), read(Y),string_lower(Y,Y1),split_string(Y1," ",".,",X),verificarSentidoLogico(X).

verificarAccion(L):- miembro("hola", L), miembro("mayce",L), conseguirIdentificacion().
verificarAccion(L):- miembro("permiso", L), miembro("despegar",L), write("Adios"), nl, !.
verificarAccion(L):- miembro("mayday", L), write("Adios"), nl, !.

conseguirIdentificacion() :- write("Porfavor identifiquese : "), read(X), string_lower(X,X1), split_string(X1," ",".,",L), conseguirAvion().

conseguirAvion():-write("¿Qué tipo de Aeronave es?"), read(X), string_lower(X,X1), split_string(X1," ",".,",L), conseguirHoraDeSalida().

conseguirHoraDeSalida():-write("Indique la hora de salida"), read(X), string_lower(X,X1), split_string(X1," ",".,",L).

conseguirDireccion():-write("Indique la direccion"), read(X), string_lower(X,X1), split_string(X1," ",".,",L).

despedirse():-write("Adios"), nl, !.

main :- read(Y),string_lower(Y,Y1),split_string(Y1," ",".,",L), verificarAccion(L1), main.

