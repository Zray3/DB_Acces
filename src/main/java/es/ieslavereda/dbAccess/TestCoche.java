package es.ieslavereda.dbAccess;

import es.ieslavereda.dbAccess.model.taserfan.*;

import java.sql.SQLException;

public class TestCoche {
    public static void main(String[] args) {
        GestionCoche gc = new GestionCoche();
        try {
            Coche coche = gc.getCoche("1111AAA");
            System.out.println(coche);

            coche.setMatricula("NUEVO2");
            gc.addCoche(coche);
            System.out.println(coche);
            coche.setNumPlazas((short) 9);
            coche.setNumPuertas((short) 9);
            gc.updateCoche(coche);
            System.out.println(coche);

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
