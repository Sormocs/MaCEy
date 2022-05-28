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


asignar_pista_1(Aeronave,Hora,Tamano):-
    aeronave(Aeronave,Tamano),
    pista_1(X),
    not(miembro(Hora,X)),concatenar(X,[Hora],Y),pista_1(Y),retract(pista_1(X)),assert(pista_1(Y)).


asignar_pista_2_1(Aeronave,Hora,Tamano):-
    aeronave(Aeronave,Tamano),
    pista_2_1(X),
    not(miembro(Hora,X)),concatenar(X,[Hora],Y),pista_2_1(Y),retract(pista_2_1(X)),assert(pista_2_1(Y)).

asignar_pista_2_2(Aeronave,Hora,Tamano):-
    aeronave(Aeronave,Tamano),
    pista_2_2(X),
    not(miembro(Hora,X)),concatenar(X,[Hora],Y),pista_2_2(Y),retract(pista_2_2(X)),assert(pista_2_2(Y)).

asignar_pista_3(Aeronave,Hora,Tamano):-
    aeronave(Aeronave,Tamano),
    pista_3(X),
    not(miembro(Hora,X)),concatenar(X,[Hora],Y),pista_3(Y),retract(pista_3(X)),assert(pista_3(Y)).


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

concatena([],L,L).
concatena([H|T],L2,[H|L3]) :- concatena(T,L2,L3).

