package es.ieslavereda.dbAccess;

import es.ieslavereda.dbAccess.model.taserfan.*;

import java.sql.SQLException;

public class TestCoche {
    public static void main(String[] args) {
        GestionCoche gc = new GestionCoche();
        try {
            Coche coche = gc.getCoche("1111AAA");
            System.out.println(coche);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
