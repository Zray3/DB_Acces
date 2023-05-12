CREATE DEFINER=`xavier`@`%` PROCEDURE `empleadoPorCargo`(IN inCargo varchar(10))
BEGIN
select id, DNI, nombre, apellidos, domicilio,CP,email,fechaNac,cargo from empleado
where cargo = inCargo;
END