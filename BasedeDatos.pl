%Funcion miembro para detectar si un elemento pertenece a la lista, en este caso utilizado para las horas.
miembro(H,[H|_T]).
miembro(X,[_H|T]) :-  miembro(X,T).

%Definicion de  las aeronaves

aeronave("cessna","pequeña").
aeronave("beechcraft","pequeña").
aeronave("embraerphenom","pequeña").
aeronave("boing717","mediana").
aeronave("embraer190","mediana").
aeronave("airbusa220","mediana").
aeronave("boing747","grande").
aeronave("airbusa340","grande").
aeronave("airbusa380","grande").

%Definicion de pistas con la lista que corresponde a su disponibilidad.
pista_1([]).
pista_2_1([]).
pista_2_2([]).
pista_3([]).

%Reglas que asignan la pista a la aeronave. Reciben la aeronave, hora y el tamano de la misma.
asignar_pista_1(Aeronave,Hora,Tamano):-
    aeronave(Aeronave,Tamano),
    pista_1(X),
    not(miembro(Hora,X)),concatenar(X,[Hora],Y).


asignar_pista_2_1(Aeronave,Hora,Tamano):-
    aeronave(Aeronave,Tamano),
    pista_2_1(X),
    not(miembro(Hora,X)),concatenar(X,[Hora],Y).

asignar_pista_2_2(Aeronave,Hora,Tamano):-
    aeronave(Aeronave,Tamano),
    pista_2_2(X),
    not(miembro(Hora,X)),concatenar(X,[Hora],Y).

asignar_pista_3(Aeronave,Hora,Tamano):-
    aeronave(Aeronave,Tamano),
    pista_3(X),
    not(miembro(Hora,X)),concatenar(X,[Hora],Y),pista_3(Y).


%Definicion Emergencias
emergencia("Perdida de Motor").
emergencia("Perdida de Combustible").
emergencia("Parto en medio vuelo").
emergencia("Paro cardiaco de pasajero").
emergencia("Secuestro").
emergencia("Aeronave con malfuncionamiento").

atencion_emergencia("Llamar bomberos").
atencion_emergencia("Llamar a la policia y OIJ").
atencion_emergencia("Llamar a la central").
atencion_emergencia("Llamar a medico").

%aerolineas
aerolinea("tec-airlines").
aerolinea("ace").
aerolinea("avianca").

%matricula
matricula("alfa_charlie_tango_lima").
matricula("delta_echo_hotel_victor").
matricula("fox_bravo_hotel_romeo").

%verificar si la arolinea existe
existe_aerolinea(Aerolinea):-
    aerolinea(Aerolinea).

%verificar si la matricula existe
existe_matricula(Matricula):-
    matricula(Matricula).

%verificar si la aeronave existe
existe_aeronave(Aeronave):-
    aeronave(Aeronave,_).

%Concatenar listas, recibe una lista y un elemento u otra lista y devuelve una lista con el elemento o lista concatenado.
concatenar([],L,L).
concatenar([H|T],L2,[H|L3]) :- concatenar(T,L2,L3).

%Obtener la cabeza de la lista. Recibe una lista y devuelve la cabeza de la misma con la variable restante.
cabeza(X,[X|_T]).
%Obtener cola de la lista
cola([_H|T],T).

%Las reglas se encargan de verificar si la pista se encuentra ocupada a determinada hora.
pista1_ocupada(Hora):-
    pista_1(X),
    miembro(Hora,X).

pista_2_1_ocupada(Hora):-
    pista_2_1(X),
    miembro(Hora,X).

pista_2_2_ocupada(Hora):-
    pista_2_2(X),
    miembro(Hora,X).

pista_3_ocupada(Hora):-
    pista_3(X),
    miembro(Hora,X).

%Las reglas siguientes se encargan de verificar la disponibilidad de las pistas y asignar una aeronave a una hora para la misma.
%Reciben a la aeronave y una variable para la respuesta de pista asignada.
verificarAeronave(N,C4,T):-
    aeronave(N,"pequeña"), not(pista1_ocupada(C4)),asignar_pista_1(N,C4,"pequeña"), T= "Pista 1".

verificarAeronave(N,C4,T):-
    aeronave(N,"pequeña"), not(pista_2_1_ocupada(C4)),asignar_pista_2_1(N,C4,"pequeña"), T= "Pista 2-1".

verificarAeronave(N,C4,T):-
    aeronave(N,"pequeña"), not(pista_2_2_ocupada(C4)),asignar_pista_2_2(N,C4,"pequeña"), T= "Pista 2-2".

verificarAeronave(N,C4,T):-
    aeronave(N,"pequeña"), not(pista_3_ocupada(C4)),asignar_pista_3(N,C4,"pequeña"), T= "Pista 3".

verificarAeronave(N,C4,T):-
    aeronave(N,"mediana"), not(pista_2_1_ocupada(C4)),asignar_pista_2_1(N,C4,"mediana"), T= "Pista 2-1".

verificarAeronave(N,C4,T):-
    aeronave(N,"mediana"), not(pista_2_2_ocupada(C4)),asignar_pista_2_2(N,Hora,"mediana"), T= "Pista 2-2".

verificarAeronave(N,C4,T):-
    aeronave(N,"mediana"), not(pista_3_ocupada(C4)),asignar_pista_3(N,Hora,"mediana"), T= "Pista 2-2".

verificarAeronave(N,C4,T):-
    aeronave(N,"grande"), not(pista_3_ocupada(C4)),asignar_pista_3(N,Hora,"grande"), T= "Pista 3".

%Regla de entrada de datos, recibe la llamada desde el chat principal.
llamarABase(X,R):-
    cabeza(C,X),
    cola(X,Col),
    cabeza(C2,Col),
    cola(Col,Col2),
    cabeza(C3,Col2),
    cola(Col2,Col3),
    cabeza(C4,Col3),
    verificarAeronave(C3,C4,T),
    R = ["Asignado",T,C2,"a las ",C4].

