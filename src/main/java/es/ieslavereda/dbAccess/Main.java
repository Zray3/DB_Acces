package es.ieslavereda.dbAccess;

import es.ieslavereda.dbAccess.model.Conector;

import javax.sql.DataSource;
import java.sql.Connection;

public class Main {
    public static void main(String[] args) {

        // Con la clase antigua
        es.ieslavereda.dbAccess.model.ConectorDM.conectarOracle();
        es.ieslavereda.dbAccess.model.ConectorDM.conectarMySQL();

        Connection connection = null;
        try{
            DataSource dataSource = Conector.getMyOracleDataSource();
            connection = dataSource.getConnection();
            if (connection != null)
                System.out.println("Acceso realizado con éxito");
        } catch (Exception e){
            System.out.println("ERROR DE CONEXION");
            e.printStackTrace();
        }

    }
}
