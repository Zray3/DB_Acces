package es.ieslavereda.dbAccess;

import es.ieslavereda.dbAccess.model.AlmacenDatosDB;
import es.ieslavereda.dbAccess.model.Empleado;
import es.ieslavereda.dbAccess.model.MySqlDataBase;

import java.util.ArrayList;
import java.util.List;

public class TestDB {
    public static void main(String[] args) {
        AlmacenDatosDB db = new MySqlDataBase();
        List<Empleado> empleados = db.getEmpleados();
        System.out.println(empleados);

        Empleado empleado = db.getEmpleado("2Y");
        System.out.println(empleado);
        empleado = db.getEmpleado("2X");
        System.out.println(empleado);

        empleado.setApellidos("rosillo");
        empleado.setNombre("xavier");
        db.updateEmpleado(empleado);
        System.out.println(empleado);


    }
}
