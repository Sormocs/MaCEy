sustantivo-->[];["gracias"];["mayday"];["hola"];["aeronave"];["avion"];["vuelo"];["kilometro"];["km"];["maycey"];["salida"];["aterrizaje"];["aerolinea"];["matricula"];["permiso"];["hora"];["direccion"];["gusto"];["velocidad"];["distancia"];["emergencia"];["motor"];["pasajero"];["secuestro"];["bombero"];["medico"];["oij"];["pista"].
sustantivos-->[];["aeronaves"];["kilometros"];["kms"];["emergencias"];["motores"];["pasajeros"];["secuestros"];["bomberos"];["medicos"].
verbos-->[];["quiero"];["despegar"];["ayudar"];["aterrizar"];["indicar"];["ser"];["estar"];["dirigir"];["asignar"];["disminuir"];["lograr"];["perder"];["solicitar"];["cambio"];["puedo"];["puede"];["podria"];["indica"];["indique"];["indicaria"];["es"];["seria"];["estoy"];["dirijo"];["dirige"];["disminuimos"];["disminuire"];["disminuya"];["logremos"];["logre"];["perdi"];['pierda'];["perdamos"];["perderemos"];["solicite"];["solicito"];["solicitamos"].
velocidades --> ["100"];["200"];["300"];["400"];["500"];["600"];["700"];["800"];["900"];["1000"];["kmph"];["kmh"];["km/h"].
hora --> ["00:00"];["00:30"];["01:00"];["01:30"];["02:00"];["02:30"];["03:00"];["03:30"];["04:00"];["04:30"];["05:00"];["05:30"];["06:00"];["06:30"];["07:00"];["07:30"];["08:00"];["08:30"];["09:00"];["09:30"];["10:00"];["10:30"];["11:00"];["11:30"];["12:00"];["12:30"];["13:00"];["13:30"];["14:00"];["14:30"];["15:00"];["15:30"];["16:00"];["16:30"];["17:00"];["17:30"];["18:00"];["18:30"];["19:00"];["19:30"];["20:00"];["20:30"];["21:00"];["21:30"];["22:00"];["22:30"];["23:00"];["23:30"];["am"];["pm"].

articulo-->[];["el"];["un"];["uno"];["la"];["una"];["lo"];["los"];["unos"];["las"];["unas"].

preposicion-->[];["a"];["al"];["ante"];["bajo"];["con"];["contra"];["de"];["del"];["desde"];["en"];["entre"];["hacia"];["hasta"];["para"];["por"];["segun"];["sin"];["sobre"];["tras"].

conjunccion-->[];["y"];['o'].

pronombres -->[];["mi"].

adverbio-->[];["fuera"];["inmediato"];["mucho"];["mucha"];["muchos"];["muchas"].

puntos_direccion--> ["este"];["oeste"];["norte"];["sur"].

%Oracion formada por una oracion nominal y una oracion verbal
oracion-->sintagma_nominal,sintagma_verbal.

%Oracion nominal
sintagma_nominal-->[].
sintagma_nominal-->sustantivo.
sintagma_nominal-->sustantivo, sustantivo.
sintagma_nominal-->sustantivo, preposicion, sustantivo.
sintagma_nominal-->puntos_direccion, preposicion, puntos_direccion.
sintagma_nominal-->preposicion.
sintagma_nominal-->preposicion,adverbio.
sintagma_nominal-->articulo,preposicion,articulo,sustantivos.
sintagma_nominal-->adverbio,sustantivo.
sintagma_nominal-->hora, hora.
sintagma_nominal-->pronombres,sustantivo.
sintagma_nominal-->velocidades,velocidades, sustantivo, verbos, velocidades, sustantivo, conjunccion, sustantivo, puntos_direccion, preposicion, puntos_direccion.

%oracion verbal
sintagma_verbal-->[].
sintagma_verbal-->verbos,sintagma_nominal.
sintagma_verbal-->verbos,conjunccion,adverbio.
sintagma_verbal-->verbos,sintagma_nominal,verbos,sintagma_nominal.
sintagma_verbal-->verbos,verbos.


