package es.ieslavereda.dbAccess.model;

import com.mysql.cj.jdbc.MysqlDataSource;

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

    @Override
    public Empleado getEmpleado(String DNI) {
        Empleado empleado = null;
        DataSource ds = Conector.getMySQLDataSource();

        try(Connection con = ds.getConnection();
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from empleado where DNI = '" + DNI + "';");){
            if(rs.next()){
                empleado = new Empleado(rs.getInt("id"),rs.getString("DNI"),
                        rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),
                        rs.getString("email"), rs.getDate(8),rs.getString(9));
            }
        } catch (SQLException exception){
            exception.printStackTrace();
        }
        return empleado;
    }

    @Override
    public int updateEmpleado(Empleado empleado) {
        int actualizados=0;
        DataSource ds = Conector.getMySQLDataSource();
        
        try(Connection connection = ds.getConnection();
             Statement statement = connection.createStatement();) {

            String query = "UPDATE empleado SET nombre=\""+empleado.getNombre()+"\", "+
                    "apellidos=\""+empleado.getApellidos()+"\","+
                    "domicilio=\""+empleado.getDomicilio()+"\","+
                    "CP=\""+empleado.getCP()+"\","+
                    "email=\""+empleado.getEmail()+"\","+
                    "fechaNac=\""+empleado.getFechaNac()+"\","+
                    "cargo=\""+empleado.getCargo()+"\" "+
                    "WHERE DNI=\"" + empleado.getDNI() +"\"";
            actualizados = statement.executeUpdate(query);


        } catch (Exception e){
            e.printStackTrace();
        }
        return actualizados;
    }

    @Override
    public int deleteEmpleado(String dni) {
        int actualizados=0;
        DataSource ds = Conector.getMySQLDataSource();

        try(Connection connection = ds.getConnection();
            Statement statement = connection.createStatement();){

            String query = "DELETE FROM empleado WHERE DNI = '" + dni + "'";
            actualizados = statement.executeUpdate(query);

        } catch (SQLException e){
            e.printStackTrace();
        }

        return actualizados;
    }

    @Override
    public Empleado addEmpleado(Empleado empleado) {
        int actualizados=0;
        DataSource ds = Conector.getMySQLDataSource();

        try(Connection connection = ds.getConnection();
            Statement statement = connection.createStatement();){

            String query = "INSERT INTO EMPLEADO(DNI, nombre, apellidos, domicilio, CP," +
                  " email, fechaNac, cargo, password) VALUES (" +
                    "'" + empleado.getDNI() + "','" + empleado.getNombre() +
                    "','" + empleado.getApellidos() +
                    "','" + empleado.getDomicilio() + "','" + empleado.getCP() +
                    "','" + empleado.getEmail() +
                    "','" + empleado.getFechaNac() + "','" + empleado.getCargo() +
                    "','" + empleado.getPassword()+"');";
            actualizados = statement.executeUpdate(query);

        } catch (SQLException e){
            e.printStackTrace();
        }
        return empleado;
    }

    @Override
    public boolean authenticate(String login, String passwd) {
        boolean auth = false;
        String sql = "SELECT COUNT(*) FROM EMPLEADO WHERE " +
                "EMAIL=\"" + login + "\" AND PASSWOD =\"" + passwd+"\"";
        DataSource ds = Conector.getMySQLDataSource();
        try(Connection con = ds.getConnection();
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery(sql)){

            rs.next();
            int count = rs.getInt(1);
            auth = (count==0)?false:true;

        } catch (SQLException e){
            e.printStackTrace();
        }
        return auth;
    }
}
