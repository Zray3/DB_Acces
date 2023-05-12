/* Insertamos carnets */
insert into carnet VALUES
(0,'NO', 'Sin carnet');
insert into carnet VALUES
(1,'AM', 'Ciclomotor');
insert into carnet VALUES
(2,'A', 'Solo motos');
insert into carnet VALUES
(3,3, 'Solo coches');
insert into carnet VALUES
(4,'C', 'Furgonetas y coches');
insert into carnet VALUES
(5,'D', 'Microbús y coches');
insert into carnet VALUES
(6,'E', 'Cualquier vehículo');
insert into carnet VALUES
(9,'Z', 'Ningún vehículo - o porque incidencia, o porque se lo han retirado');

/* Insertamos clientes */
insert into cliente (dni, nombre, apellidos, domicilio, CP, email, fechaNac, idcarnet) VALUES
('12345678B', 'alexis', 'navarro máñez', 'c/ gloria fuertes, 2', '46015', 'email21@dominio.es', '14/3/1977', 3);
insert into cliente (dni, nombre, apellidos, domicilio, CP, email, fechaNac, idcarnet) VALUES
('11111111C', 'monica', 'olmo soria', 'c/ constitución, 20', '46115', 'email22@dominio.es','24/1/1987', 3);
insert into cliente (dni, nombre, apellidos, domicilio, CP, email, fechaNac, idcarnet) VALUES
('22222222D', 'david', 'garcía pastor', 'c/ democracia, 1', '46215', 'email23@dominio.es','7/2/1973', 0);
insert into cliente (dni, nombre, apellidos, domicilio, CP, email, fechaNac, idcarnet) VALUES
('33333333E', 'ana', 'torro molla', 'c/ rodríguez de la fuente, 2', '46315', 'email24@dominio.es','14/3/1966', 1);
insert into cliente (dni, nombre, apellidos, domicilio, CP, email, fechaNac, idcarnet) VALUES
('44444444F', 'raquel', 'ramos gilabert', 'c/ machado, 15', '46415', 'email31@dominio.es','29/4/1983', 3);
insert into cliente (dni, nombre, apellidos, domicilio, CP, email, fechaNac, idcarnet) VALUES
('55555555G', 'miguel', 'martí sánchez', 'c/ lopez vega, 5', '46515', 'email32@dominio.es','1/5/1989', 2);
insert into cliente (dni, nombre, apellidos, domicilio, CP, email, fechaNac, idcarnet) VALUES
('66666666H', 'jose', 'díaz martínez', 'c/ cavallers, 9', '46615', 'email33@dominio.es','28/6/1991', 0);
insert into cliente (dni, nombre, apellidos, domicilio, CP, email, fechaNac, idcarnet) VALUES
('77777777I', 'florencio', 'higueras flores', 'c/ sant miquel, 7', '46715', 'email34@dominio.es','29/3/1999', 1);
insert into cliente (dni, nombre, apellidos, domicilio, CP, email, fechaNac, idcarnet) VALUES
('88888888J', 'arcadio', 'pintado jaen', 'c/ sant jaume, 6', '46815', 'email35@dominio.es','1/1/2001', 3);
insert into cliente (dni, nombre, apellidos, domicilio, CP, email, fechaNac, idcarnet) VALUES
('99999999K', 'mariano', 'rus roig', 'c/ major, 100', '46915', 'email55@dominio.es','24/12/2000', 3);
insert into cliente (dni, nombre, apellidos, domicilio, CP, email, fechaNac, idcarnet) VALUES
('23456789L', 'manuel', 'moreno zarzoso', 'c/ pere, 2', '46025', 'email54@dominio.es','14/11/1977', 3);
insert into cliente (dni, nombre, apellidos, domicilio, CP, email, fechaNac, idcarnet) VALUES
('34567890M', 'raúl', 'viade moya', 'c/ de les mates, 2', '46035', 'email44@dominio.es','24/10/1997', 2);
insert into cliente (dni, nombre, apellidos, domicilio, CP, email, fechaNac, idcarnet) VALUES
('45678901N', 'javier', 'torres pérez', 'c/ informàtica, 43', '46045', 'email99@dominio.es','1/11/1991', 0);
insert into cliente (dni, nombre, apellidos, domicilio, CP, email, fechaNac, idcarnet) VALUES
('56789012O', 'antonio', 'tur tur', 'c/ dijstra, 11', '46005', 'email69@dominio.es', '9/11/1995', 1);
insert into cliente (dni, nombre, apellidos, domicilio, CP, email, fechaNac, idcarnet) VALUES
('67890123P', 'luis', 'santiago sánchez', 'c/ ada lovelace, 13', '46055', 'email61@dominio.es','11/11/1975', 2);
insert into cliente (dni, nombre, apellidos, domicilio, CP, email, fechaNac, idcarnet) VALUES
('78901234Q', 'nuria', 'rodríguez ramírez', 'c/ von neumann, 17', '46065', 'email62@dominio.es','2/7/1967', 0);
insert into cliente (dni, nombre, apellidos, domicilio, CP, email, fechaNac, idcarnet) VALUES
('89012345R', 'marta', 'osvaldo ostarriz', 'c/ grace murray, 19', '46075', 'email63@dominio.es','3/7/1997', 1);
insert into cliente (dni, nombre, apellidos, domicilio, CP, email, fechaNac, idcarnet) VALUES
('90123456S', 'emma', 'pérez pérez', 'c/ baggage, 23', '46019', 'email3@dominio.es','4/6/1992', 3);
insert into cliente (dni, nombre, apellidos, domicilio, CP, email, fechaNac, idcarnet) VALUES
('01234567T', 'carmen', 'nuncia lópez', 'c/ turing, 42', '46018', 'email2@dominio.es','5/5/1988', 3);
insert into cliente (dni, nombre, apellidos, domicilio, CP, email, fechaNac, idcarnet) VALUES
('00000001W', 'eva', 'martínez valero', 'c/ pascal, 99', '46011', 'email1@dominio.es','6/4/1982', 2);

/* Insertamos vehículos - coches*/
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('0000AAA', 5.99, 'BMW i3', 'verde', 45, '07/01/2021', 'preparado', 3);
insert INTO coche (matricula, numPlazas, numPuertas) values
('0000AAA', 4, 4);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('1111AAA', 5.99, 'BMW i3', 'rojo', 45, '07/01/2021', 'preparado', 3);
insert INTO coche (matricula, numPlazas, numPuertas) values
('1111AAA', 4, 4);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('2222AAA', 5.99, 'BMW i3', 'azul', 45, '07/01/2021', 'preparado', 3);
insert INTO coche (matricula, numPlazas, numPuertas) values
('2222AAA', 4, 4);

insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('3333AAA', 7.99, 'Tesla s3', 'blanco', 150, '11/11/2020', 'preparado', 3);
insert INTO coche (matricula, numPlazas, numPuertas) values
('3333AAA', 5, 5);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('4444AAA', 7.99, 'Tesla s3', 'negro', 150, '11/11/2020', 'preparado', 3);
insert INTO coche (matricula, numPlazas, numPuertas) values
('4444AAA', 5, 5);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('5555AAA', 7.99, 'Tesla s3', 'amarillo', 150, '11/11/2020', 'preparado', 3);
insert INTO coche (matricula, numPlazas, numPuertas) values
('5555AAA', 5, 5);

insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('6666AAA', 5.99, 'Renault Captur HE', 'rojo', 20, '28/02/2021', 'preparado', 3);
insert INTO coche (matricula, numPlazas, numPuertas) values
('6666AAA', 5, 4);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('7777AAA', 5.99, 'Renault Captur HE', 'verde', 20, '28/02/2021', 'preparado', 3);
insert INTO coche (matricula, numPlazas, numPuertas) values
('7777AAA', 5, 4);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('8888AAA', 5.99, 'Renault Captur HE', 'amarillo', 20, '28/02/2021', 'preparado', 3);
insert INTO coche (matricula, numPlazas, numPuertas) values
('8888AAA', 5, 4);

insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('9999AAA', 4.99, 'FIAT 500', 'azul', 30,  '07/01/2019', 'preparado', 3);
insert INTO coche (matricula, numPlazas, numPuertas) values
('9999AAA', 4, 3);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('0000AAB', 4.99, 'FIAT 500', 'blanco', 30,  '07/01/2019', 'preparado', 3);
insert INTO coche (matricula, numPlazas, numPuertas) values
('0000AAB', 4, 3);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('1111AAB', 4.99, 'FIAT 500', 'amarillo', 30,  '07/01/2019', 'preparado', 3);
insert INTO coche (matricula, numPlazas, numPuertas) values
('1111AAB', 4, 3);

insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('2222AAB', 2.99, 'Ligier JS50', 'verde', 20, '01/08/2018', 'preparado', 1);
insert INTO coche (matricula, numPlazas, numPuertas) values
('2222AAB', 2, 2);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('3333AAB', 2.99, 'Ligier JS50', 'blanco', 20, '01/08/2018', 'preparado', 1);
insert INTO coche (matricula, numPlazas, numPuertas) values
('3333AAB', 2, 2);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('4444AAB', 2.99, 'Ligier JS50', 'negro', 20, '01/08/2018', 'preparado', 1);
insert INTO coche (matricula, numPlazas, numPuertas) values
('4444AAB', 2, 2);

insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('5555AAB', 2.99, 'Highland X', 'verde', 30, '07/01/2018', 'preparado', 1);
insert INTO coche (matricula, numPlazas, numPuertas) values
('5555AAB', 2, 2);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('6666AAB', 2.99, 'Highland X', 'rojo', 30, '07/01/2019', 'preparado', 1);
insert INTO coche (matricula, numPlazas, numPuertas) values
('6666AAB', 2, 2);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('7777AAB', 2.99, 'Highland X', 'azul', 30, '07/01/2020', 'preparado', 1);
insert INTO coche (matricula, numPlazas, numPuertas) values
('7777AAB', 2, 2);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('8888AAB', 2.99, 'Highland X', 'negro', 30, '07/01/2021', 'preparado', 1);
insert INTO coche (matricula, numPlazas, numPuertas) values
('8888AAB', 2, 2);

/* Insertamos vehículos - motos*/
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('1234BBB', 1.99, 'Piaggio 1, 1+', 'blanco', 10, '07/01/2019', 'preparado', 1);
insert INTO moto (matricula, velocidadMax, cilindrada) values
('1234BBB', 65, 50);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('2355BBB', 2.50, 'Invicta iTank', 'blanco', 10, '07/01/2020', 'preparado', 1);
insert INTO moto (matricula, velocidadMax, cilindrada) values
('2355BBB', 80, 50);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('3991BBB', 2.99, 'Seat MO', 'azul', 20, '07/01/2021', 'preparado', 2);
insert INTO moto (matricula, velocidadMax, cilindrada) values
('3991BBB', 100, 75);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('9999BBB', 0.99, 'NIU UQi Sport', 'azul', 10, '01/08/2020', 'preparado', 1);
insert INTO moto (matricula, velocidadMax, cilindrada) values
('9999BBB', 50, 50);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('8888BBB', 2.99, 'BMW CE04', 'negro', 20, '01/09/2020', 'preparado', 2);
insert INTO moto (matricula, velocidadMax, cilindrada) values
('8888BBB', 200, 750);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('7777BBB', 5.99, 'Harley Davidson Livewire', 'rojo', 25, '07/01/2021', 'preparado', 2);
insert INTO moto (matricula, velocidadMax, cilindrada) values
('7777BBB', 300, 1100);

/* Insertamos vehículos - bicicleta*/
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('0000CCC', 0.99, 'Riverside', 'negro', 5, '07/01/2021', 'preparado', 0);
insert INTO bicicleta (matricula, tipo) values
('0000CCC', 'paseo');
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('1111CCC', 0.99, 'RockRider', 'negro', 5, '07/01/2021', 'preparado', 0);
insert INTO bicicleta (matricula, tipo) values
('1111CCC', 'montaña');
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('2222CCC', 0.99, 'RockRider', 'negro', 5, '07/01/2021', 'preparado', 0);
insert INTO bicicleta (matricula, tipo) values
('2222CCC', 'montaña');
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('0000CCD', 1.50, 'NCM', 'negro', 5, '07/01/2021', 'preparado', 0);
insert INTO bicicleta (matricula, tipo) values
('0000CCD', 'hibrida');
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('1111CCD', 1.50, 'NCM', 'negro', 5, '07/01/2021', 'preparado', 0);
insert INTO bicicleta (matricula, tipo) values
('1111CCD', 'hibrida');
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('2222CCD', 1.50, 'NCM', 'negro', 5, '07/01/2021', 'preparado', 0);
insert INTO bicicleta (matricula, tipo) values
('2222CCD', 'hibrida');

/* Insertamos vehículos - patinetes*/
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('2222DDD', 0.19, 'Aprilia eSR1', 'blanco', 2, '09/09/2020', 'preparado', 0);
insert INTO patinete (matricula, numRuedas, tamanyo) values
('2222DDD', 2, 10);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('3333DDD', 0.19, 'Aprilia eSR1', 'blanco', 2, '09/09/2020', 'preparado', 0);
insert INTO patinete (matricula, numRuedas, tamanyo) values
('3333DDD', 2, 10);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('4444DDD', 0.39, 'Aprilia eSR2', 'blanco', 3, '09/09/2020', 'preparado', 0);
insert INTO patinete (matricula, numRuedas, tamanyo) values
('4444DDD', 2, 12);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('5555DDD', 0.79, 'SSCYHT', 'negro', 3, '09/09/2020', 'preparado', 0);
insert INTO patinete (matricula, numRuedas, tamanyo) values
('5555DDD', 3, 10);
insert INTO vehiculo (matricula, precioHora, marca, color, bateria, fechaAdq, estado, idcarnet) values
('6666DDD', 0.79, 'SSCYHT', 'negro', 5, '09/09/2020', 'preparado', 0);
insert INTO patinete (matricula, numRuedas, tamanyo) values
('6666DDD', 3, 10);


/* creamos los empleados: gerentes, mantenimiento, administrativos, mecanicos */
insert into empleado(DNI, nombre, apellidos, domicilio, CP, email, fechaNac, cargo, password) VALUES
('87654321Z', 'pepa', 'navarro garcía', 'c/ pez, 14', '46185', 'pepa@mordor.es', '28/06/1957', 'gerente', encrypt_paswd.encrypt_val('1111'));
insert into empleado(DNI, nombre, apellidos, domicilio, CP, email, fechaNac, cargo, password) VALUES
('76543210Y', 'luna', 'garcía navarro', 'c/ perro, 7', '46185', 'luna@mordor.es', '14/02/1973', 'gerente', encrypt_paswd.encrypt_val('1111'));
insert into empleado(DNI, nombre, apellidos, domicilio, CP, email, fechaNac, cargo, password) VALUES
('65432109X', 'manuel', 'gonzález garmendia', 'c/ gato, 1', '46019', 'manuel@mordor.es', '09/09/1963', 'mantenimiento', encrypt_paswd.encrypt_val('1111'));
insert into empleado(DNI, nombre, apellidos, domicilio, CP, email, fechaNac, cargo, password) VALUES
('54321098W', 'joaquin', 'ferrando gabarda', 'c/ caballo, 17', '46019', 'joaquin@mordor.es', '11/11/1977', 'mantenimiento', encrypt_paswd.encrypt_val('1111'));
insert into empleado(DNI, nombre, apellidos, domicilio, CP, email, fechaNac, cargo, password) VALUES
('43210987V', 'vicente', 'cascales martínez', 'c/ león, 42', '46018', 'vicente@mordor.es', '09/11/1987', 'administrativo', encrypt_paswd.encrypt_val('1111'));
insert into empleado(DNI, nombre, apellidos, domicilio, CP, email, fechaNac, cargo, password) VALUES
('32109876U', 'jose', 'hurtado fernández', 'c/ tigre, 55', '46018', 'jose@mordor.es', '10/04/1993', 'administrativo', encrypt_paswd.encrypt_val('1111'));
insert into empleado(DNI, nombre, apellidos, domicilio, CP, email, fechaNac, cargo, password) VALUES
('21098765T', 'carmen', 'esteve gonzález', 'c/ zorro, 44', '46001', 'carmen@mordor.es', '27/04/1999', 'administrativo', encrypt_paswd.encrypt_val('1111'));
insert into empleado(DNI, nombre, apellidos, domicilio, CP, email, fechaNac, cargo, password) VALUES
('10765432S', 'nuria', 'sanz taus', 'c/ lobo, 33', '46001', 'nuria@mordor.es', '04/08/2000', 'mecanico', encrypt_paswd.encrypt_val('1111'));
insert into empleado(DNI, nombre, apellidos, domicilio, CP, email, fechaNac, cargo, password) VALUES
('07654321R', 'cindy', 'peris sancho', 'c/ buitre, 2', '46003', 'cindy@mordor.es', '03/07/1988', 'mecanico', encrypt_paswd.encrypt_val('1111'));
insert into empleado(DNI, nombre, apellidos, domicilio, CP, email, fechaNac, cargo, password) VALUES
('88843210Q', 'vanesa', 'codina andújar', 'c/ quebrantahuesos, 7', '46003', 'vanesa@mordor.es', '19/06/1983', 'mecanico', encrypt_paswd.encrypt_val('1111'));

/* en este momento inicial tenemos todos los vehículos preparados, con lo cual la tabla gestiónVehículo está vacía */

/* todas las facturas excepto las del mes de abril están en el histórico */
insert into factura(idFactura, fecha, importeBase, idcliente) values
(1973, '01/04/2022', 0.79*3,3);
insert into factura(idFactura, fecha, importeBase, idcliente) values
(1974, '01/04/2022', (2.99*24 + 0.99*10),4);
insert into factura(idFactura, fecha, importeBase, idcliente) values
(1975, '02/04/2022', 4.99*3*24*2,5);
insert into factura(idFactura, fecha, importeBase, idcliente) values
(1976, '02/04/2022', 2.99*3,6);

insert into alquiler(idFactura, matricula, fechaInicio, fechaFin, precio) values
(1973, '6666DDD', to_date('01/04/2022 10:00:00', 'DD/MM/YYYY HH24:MI:SS'), to_date('01/04/2022 13:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.79*3);
insert into alquiler(idFactura, matricula, fechaInicio, fechaFin, precio) values
(1974, '4444AAB', to_date('01/04/2022 10:00:00', 'DD/MM/YYYY HH24:MI:SS'), to_date('02/04/2022 10:00:00', 'DD/MM/YYYY HH24:MI:SS'), 2.99*24);
insert into alquiler(idFactura, matricula, fechaInicio, fechaFin, precio) values
(1974, '9999BBB', to_date('02/04/2022 10:00:00', 'DD/MM/YYYY HH24:MI:SS'), to_date('02/04/2022 20:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.99*10);
insert into alquiler(idFactura, matricula, fechaInicio, fechaFin, precio) values
(1975, '0000AAB', to_date('02/04/2022 10:00:00', 'DD/MM/YYYY HH24:MI:SS'), to_date('05/04/2022 10:00:00', 'DD/MM/YYYY HH24:MI:SS'), 4.99*3*24);
insert into alquiler(idFactura, matricula, fechaInicio, fechaFin, precio) values
(1975, '1111AAB', to_date('02/04/2022 10:00:00', 'DD/MM/YYYY HH24:MI:SS'), to_date('05/04/2022 10:00:00', 'DD/MM/YYYY HH24:MI:SS'), 4.99*3*24);
insert into alquiler(idFactura, matricula, fechaInicio, fechaFin, precio) values
(1976, '3991BBB', to_date('02/04/2022 12:00:00', 'DD/MM/YYYY HH24:MI:SS'), to_date('02/04/2022 15:00:00', 'DD/MM/YYYY HH24:MI:SS'), 2.99*3);
