package es.ieslavereda.dbAccess.model.taserfan;


import java.sql.SQLException;

public class TestCoche {
    public static void main(String[] args) {
        Coche testeo = null;
        GestionCoche gc = new GestionCoche();
        try{
        Coche coche = gc.getCoche("1111AAA");
        testeo = coche;
        System.out.println(coche);
        } catch (SQLException e){
            e.printStackTrace();
        }

        try{
            gc.borrarCoche("1111AAA");
        }catch(SQLException e){
            e.printStackTrace();
        }

        try{
            gc.addCoche(testeo);
        }catch (SQLException e){
            e.printStackTrace();
        }

        try{
            Coche coche = gc.getCoche("1111AAA");
            System.out.println(coche);
        } catch (SQLException e){
            e.printStackTrace();
        }


    }

}
