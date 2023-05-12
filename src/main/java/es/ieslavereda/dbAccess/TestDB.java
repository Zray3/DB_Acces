package es.ieslavereda.dbAccess;

import es.ieslavereda.dbAccess.model.AlmacenDatosDB;
import es.ieslavereda.dbAccess.model.Empleado;
import es.ieslavereda.dbAccess.model.MySqlDataBase;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class TestDB {
    public static void main(String[] args) {
        AlmacenDatosDB db = new MySqlDataBase();

        db.addEmpleado(new Empleado(0,"123456Q","eustaquio","garcia","su casa",
                "46987","email@email.es", Date.valueOf("1957-06-28"),"empleada"));
        List<Empleado> empleados = db.getEmpleados();
        System.out.println(empleados);
//
//        Empleado empleado = db.getEmpleado("2Y");
//        System.out.println(empleado);
//        empleado = db.getEmpleado("3X");
//        System.out.println(empleado);

//        empleado.setApellidos("rosillo");
//        empleado.setNombre("xavier");
//        db.updateEmpleado(empleado);
//        System.out.println(empleado);
//        System.out.println(db.deleteEmpleado("2Y"));
//        System.out.println(db.deleteEmpleado("2X"));
//        System.out.println(db.getEmpleadosPorCargo("gerente"));
//
//            String password = "1111";
//            boolean auth = db.authenticate("vanesa@mordor.es",password);
//        System.out.println("Autenticado? " + auth);



    }
}
