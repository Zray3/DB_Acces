package es.ieslavereda.dbAccess.model;

import java.util.ArrayList;

public interface AlmacenDatosDB {
    public ArrayList<Empleado> getEmpleados();
    public Empleado getEmpleado(String DNI);
    public boolean updateEmpleado(Empleado empleado);
    public boolean deleteEmpleado(String dni);

}
