:- [gramatica].
:- [basedeDatos].

%Función miembro que recibe una lista y un elemento y devuelve true si el elemento está en la lista
miembro(X, [X|_]).
miembro(X, [_|Y]):- miembro(X, Y).

%verifica si la hora es posible
horaesposible(X) :- horaposible(Y), miembro(X, Y).

%Fucion concatena que recibe dos listas y devuelve una lista con todos los elementos de las dos listas
concatena([], L, L).
concatena([X|L1], L2, [X|L3]):- concatena(L1, L2, L3).

%retorna la cabecera de una lista
cabecera([X|_], X).

%verifica si tiene sentido la oracion y si no la pide de nuevo
verificarSentidoLogico(L) :- writeln(L),oracion(L, []), verificarAccion(L),!.
verificarSentidoLogico(L) :- writeln("No entendi la peticion, intenta de nuevo."), readln(L,_,_,_,lowercase),verificarSentidoLogico(L).

%verifica que accion desea hacer el usaurio 
verificarAccion(L):- miembro("hola", L), ayudar().
verificarAccion(L):- miembro("permiso", L), miembro("despegar",L), conseguirIdentificacion(["despegar"]).
verificarAccion(L):- miembro("permiso", L), miembro("aterrizar",L), conseguirIdentificacion(["aterrizar"]).
verificarAccion(L):- miembro("mayday", L), veriAccidente().
verificarAccion(L):- writeln("No entendi la peticion, intenta de nuevo."), read(Y),string_lower(Y,Y1),split_string(Y1," ",".,",L),verificarAccion(L).

%despues de saludar
ayudar():-writeln("En que lo puedo ayudar?"), read(Y),string_lower(Y,Y1),split_string(Y1," ",".,",L), ayudaAccion(X).
ayudaAccion(L) :- miembro("solicito", L), miembro("despegar",L), conseguirIdentificacion(["despegar"]).
ayudaAccion(L) :- miembro("solicito", L), miembro("aterrizar",L), conseguirIdentificacion(["aterrizar"]).
ayudaAccion(L) :- miembro("mayday", L), veriAccidente().

%consigue la identificacion del usuario
conseguirIdentificacion(Lv) :- writeln("Porfavor identifiquese con su matricula: Consulte la base de datos"), read(Y),string_lower(Y,Y1),split_string(Y1," ",".,",L), verificarId(L,Lv).

%verifica que la identificacion sea correcta
verificarId(L,Lv):- cabecera(L,X),writeln(X), existe_matricula(X),concatena(Lv,[X],Ln), conseguirAvion(Ln).
verificarId(L,Lv):- writeln("No existe la matricula, intenta de nuevo : "), read(Y),string_lower(Y,Y1),split_string(Y1," ",".,",L), verificarId(L,Lv).

%consigue el avion del usuario
conseguirAvion(Lv):-writeln(Lv),writeln("¿Qué tipo de Aeronave es?"),read(Y),string_lower(Y,Y1),split_string(Y1," ",".,",L), verificarAeronave(L,Lv).

%verifica que el avion sea correcto
verificarAeronave(L,Lv):- cabecera(L,X),writeln(X), existe_aeronave(X),concatena(Lv,[X],Ln), conseguirHoraDeSalida(Ln).
verificarAeronave(L,Lv):- writeln("No existe la aeronave, intenta de nuevo : "), read(Y),string_lower(Y,Y1),split_string(Y1," ",".,",L), verificarAeronave(L,Lv).

%consigue la hora de salida del avion
conseguirHoraDeSalida(Lv):-writeln("Indique la hora de salida"), read(Y),string_lower(Y,Y1),split_string(Y1," ",".,",L), verificarHora(L,Lv).

%verifica que la hora sea correcta
verificarHora(L,Lv):- cabecera(L,X),writeln(X), horaesposible(X),concatena(Lv,[X],Ln), conseguirDireccion(Ln).
verificarHora(L,Lv):- writeln("Esta hora no es posible, porfavor ingrese una hora posible : "), read(Y),string_lower(Y,Y1),split_string(Y1," ",".,",L), verificarHora(L,Lv).

%consigue la hora de direccion del avion
conseguirDireccion(Lv):-writeln("Indique la direccion"),read(Y),string_lower(Y,Y1),split_string(Y1," ",".,",L), conseguirRespuesta(Lv).

%consigue la respuesta para el usuario
conseguirRespuesta(Ln):- writeln("Procesando..."),nuevaLlamada().%llamarABase(Ln,R), writeln(R).

nuevaLlamada():-writeln("¿Desea realizar otra llamada? (si o no)"), read(Y),string_lower(Y,Y1),split_string(Y1," ",".",L), verificarLlamada(L).

verificarLlamada(L):- miembro("si", L), ayudar().
verificarLlamada(L):- miembro("no", L), writeln("Gracias por utilizar nuestro servicio").
verificarLlamada(L):- writeln("No entendi la peticion, intenta de nuevo."), read(Y),string_lower(Y,Y1),split_string(Y1," ",".,",L), verificarLlamada(L).

%verifica accidente
veriAccidente():- writeln("¿cual es la emergencia?"), read(Y),string_lower(Y,Y1),split_string(Y1," ",".",L), veriAccidenteAux(L).

%verifica que es accidentes para atenderlos
veriAccidenteAux(L):- miembro("perdi",L), valiEmergencia(),llamarBomberos().
veriAccidenteAux(L):- miembro("parto",L),valiEmergencia(),llamarMedicos().
veriAccidenteAux(L):- miembro("cardiaco",L),valiEmergencia(),llamarMedicos().
veriAccidenteAux(L):- miembro("secuestro",L),valiEmergencia(),llamarPolicia().

%validar matricula y areonave emergencia
valiAeroEmergencia():- writeln("¿Qué tipo de Aeronave es?"),read(Y),string_lower(Y,Y1),split_string(Y1," ",".,",L), valiAeroEmergenciaAux(L).
valiAeroEmergenciaAux(L):- cabecera(L,X),writeln(X), existe_aeronave(X).
valiAeroEmergenciaAux(L):- writeln("No existe la aeronave, intenta de nuevo : "), read(Y),string_lower(Y,Y1),split_string(Y1," ",".,",L), valiAeroEmergenciaAux(L).

%validar matricula emergencia
valiMatriEmergencia():- writeln("Porfavor identifiquese con su matricula: Consulte la base de datos"), read(Y),string_lower(Y,Y1),split_string(Y1," ",".",L), valiMatriEmergenciaAux(L).
valiMatriEmergenciaAux(L):- cabecera(L,X),writeln(X), existe_matricula(X).
valiMatriEmergenciaAux(L):- writeln("No existe la matricula, intenta de nuevo : "), read(Y),string_lower(Y,Y1),split_string(Y1," ",".",L), valiMatriEmergenciaAux(L).

%Ateder las emergencias
valiEmergencia():- valiAeroEmergencia(),valiMatriEmergencia().

%llamadas a las autoridades
llamarBomberos():- writeln("Puede aterrizar en la P3. Se llaman a bomberos, se evacuará de inmediato"),writeln("¿Desea realizar otra llamada? (si o no)"), read(Y),string_lower(Y,Y1),split_string(Y1," ",".",L), verificarLlamada(L).
llamarMedicos():- writeln("Puede aterrizar en la P3. Se llaman a medicos, se evacuará de inmediato"),writeln("¿Desea realizar otra llamada? (si o no)"), read(Y),string_lower(Y,Y1),split_string(Y1," ",".",L), verificarLlamada(L).
llamarPolicia():- writeln("Puede aterrizar en la P3. Se llaman a policia, se evacuará de inmediato"),writeln("¿Desea realizar otra llamada? (si o no)"), read(Y),string_lower(Y,Y1),split_string(Y1," ",".",L), verificarLlamada(L).

%metodo principal
iniciar :- read(Y),string_lower(Y,Y1),split_string(Y1," ",".,",L), verificarAccion(L).

test :- readln(Y,_,_,_,lowercase), writeln(Y),oracion(L, []).

%[despegar, matricula, avion, hora]
%[aterrizar, matricula, avion, hora]
%[mayday, emergencia, matricula,avion]"