CREATE PROCEDURE `insertarCliente` (inDNI varchar(8), inNombre varchar(30), inApellidos varchar(60), 
inDomicilio varchar(100), inCP varchar(5), inEmail varchar(30), inFechaNac date, inCargo varchar(10), inPassword varchar(30))
BEGIN

	insert into empleado (DNI, nombre, apellidos, domicilio, CP, email, fechaNac, cargo, password)
    values (inDNI, inNombre, inApellidos, inDomicilio, inCP, inEmail, inFechaNac, inCargo, inPassword);

END
