package es.ieslavereda.dbAccess.model;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class MySqlDataBase implements AlmacenDatosDB{
    @Override
    public ArrayList<Empleado> getEmpleados() {
        DataSource ds = Conector.getMySQLDataSource();
        ArrayList<Empleado> empleados = new ArrayList<>();

        try(Connection con = ds.getConnection();
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM empleado");
            ) {
                Empleado empleado;
                while(rs.next()) {
                    empleado = new Empleado(rs.getInt("id"),rs.getString("DNI"),
                            rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),
                            rs.getString("email"), rs.getDate(8),rs.getString(9));
                    empleados.add(empleado);
                }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return empleados;
    }
}
