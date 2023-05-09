package es.ieslavereda.dbAccess.model;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConectorDM {

    public static Connection conectarOracle() {
        Connection connection = null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String basededatos = "jdbc:oracle:thin:@10.0.0.21:1521:XE";
            connection = DriverManager.getConnection(basededatos,"C##XAVIER","1234");
            if(connection != null)
                System.out.println("Ha conectado con éxito");
        } catch (Exception e) {
            System.out.println("NO HAS CONECTADO");
            e.printStackTrace();
        }
        return connection;
    }

    public static Connection conectarMySQL() {
        Connection connection = null;
        try{
          DriverManager.registerDriver(new com.mysql.jdbc.Driver());
           connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/accesojava?" +
                   "user=root&password=1234");
            if(connection != null)
                System.out.println("Ha conectado con éxito");
        } catch (Exception e) {
            System.out.println("NO HAS CONECTADO");
            e.printStackTrace();
        }
        return connection;
    }

}
