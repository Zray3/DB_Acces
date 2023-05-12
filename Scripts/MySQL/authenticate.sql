CREATE FUNCTION `authenticate` (inEmail VARCHAR(30), inPass varchar(30))
RETURNS INTEGER
BEGIN
declare contador integer default 0;
select count(*) into contador 
from empleado where email = inEmail and password = inPass;
RETURN contador;
END
