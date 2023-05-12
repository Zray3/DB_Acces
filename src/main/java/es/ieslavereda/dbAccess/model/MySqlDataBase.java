package es.ieslavereda.dbAccess.model;

import com.mysql.cj.jdbc.MysqlDataSource;

import javax.sql.DataSource;
import java.sql.*;
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
                            rs.getString("email"), rs.getDate(8),rs.getString(9),
                            rs.getString(10));
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
        String query = "select * from empleado where DNI = ?";

        try(Connection con = ds.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement(query);
            ){

            preparedStatement.setString(1,DNI);
            ResultSet rs = preparedStatement.executeQuery();
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
    public boolean addEmpleado(Empleado empleado) {
        boolean actualizado=false;
        DataSource ds = Conector.getMySQLDataSource();
        String sql = "{ call insertarEmpleado(?,?,?,?,?,?,?,?,?) }";

        try(Connection connection = ds.getConnection();
            CallableStatement cs = connection.prepareCall(sql);){

            cs.setString(1, empleado.getDNI());
            cs.setString(2, empleado.getNombre());
            cs.setString(3, empleado.getApellidos());
            cs.setString(4, empleado.getDomicilio());
            cs.setString(5, empleado.getCP());
            cs.setString(6, empleado.getEmail());
            cs.setDate(7, empleado.getFechaNac());
            cs.setString(8, empleado.getCargo());
            cs.setString(9, empleado.getPassword());
            actualizado = (cs.executeUpdate() == 1) ? true : false;

        } catch (SQLException e){
            e.printStackTrace();
        }
        return actualizado;
    }

//    @Override
//    public Empleado addEmpleado(Empleado empleado) {
//        int actualizados=0;
//        DataSource ds = Conector.getMySQLDataSource();
//
//        try(Connection connection = ds.getConnection();
//            Statement statement = connection.createStatement();){
//
//            String query = "INSERT INTO EMPLEADO(DNI, nombre, apellidos, domicilio, CP," +
//                    " email, fechaNac, cargo, password) VALUES (" +
//                    "'" + empleado.getDNI() + "','" + empleado.getNombre() +
//                    "','" + empleado.getApellidos() +
//                    "','" + empleado.getDomicilio() + "','" + empleado.getCP() +
//                    "','" + empleado.getEmail() +
//                    "','" + empleado.getFechaNac() + "','" + empleado.getCargo() +
//                    "','" + empleado.getPassword()+"');";
//            actualizados = statement.executeUpdate(query);
//
//        } catch (SQLException e){
//            e.printStackTrace();
//        }
//        return empleado;
//    }

//    @Override
//    public boolean authenticate(String login, String passwd) {
//        boolean auth = false;
//        String sql = "SELECT COUNT(*) FROM empleado WHERE " +
//                "EMAIL= ? AND PASSWORD = ? ";
//        DataSource ds = Conector.getMySQLDataSource();
//        try(Connection con = ds.getConnection();
//            PreparedStatement preparedStatement = con.prepareStatement(sql);
//            ){
//            preparedStatement.setString(1,login);
//            preparedStatement.setString(2,passwd);
//            ResultSet rs = preparedStatement.executeQuery();
//            rs.next();
//            int count = rs.getInt(1);
//            auth = (count==0)?false:true;
//
//        } catch (SQLException e){
//            e.printStackTrace();
//        }
//        return auth;
//    }

    @Override
    public boolean authenticate(String login, String passwd) {
        boolean auth = false;
        String sql = " { ? = call authenticate(?,?) }";
        DataSource ds = Conector.getMySQLDataSource();
        try(Connection con = ds.getConnection();
            CallableStatement cs = con.prepareCall(sql);
        ){

            cs.setString(2,login);
            cs.setString(3,passwd);

            ResultSet rs = cs.executeQuery();
            rs.next();
            int count = rs.getInt(1);
            auth = (count==0)?false:true;

        } catch (SQLException e){
            e.printStackTrace();
        }
        return auth;
    }

//    @Override
//    public ArrayList<Empleado> getEmpleadosPorCargo(String cargo) {
//        DataSource ds = Conector.getMySQLDataSource();
//        ArrayList<Empleado> empleados = new ArrayList<>();
//        String query = "select * from empleado where cargo = ?";
//
//        try(Connection connection = ds.getConnection();
//            PreparedStatement preparedStatement = connection.prepareStatement(query);){
//
//            preparedStatement.setString(1, cargo);
//            ResultSet rs = preparedStatement.executeQuery();
//            Empleado empleado;
//            while(rs.next()) {
//                empleado = new Empleado(rs.getInt("id"),rs.getString("DNI"),
//                        rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),
//                        rs.getString("email"), rs.getDate(8),rs.getString(9));
//                empleados.add(empleado);
//            }
//
//        } catch (SQLException e){
//            e.printStackTrace();
//        }
//
//
//        return empleados;
//    }

    @Override
    public ArrayList<Empleado> getEmpleadosPorCargo(String cargo) {
        DataSource ds = Conector.getMySQLDataSource();
        ArrayList<Empleado> empleados = new ArrayList<>();
        String query = "{ call empleadoPorCargo(?)} ";

        try(Connection connection = ds.getConnection();
            CallableStatement cs = connection.prepareCall(query)){

            //antes de ejecutar
            cs.setString(1,cargo);
            ResultSet rs = cs.executeQuery();

            Empleado empleado;
            while(rs.next()) {
                empleado = new Empleado(rs.getInt("id"),rs.getString("DNI"),
                        rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),
                        rs.getString("email"), rs.getDate(8),rs.getString(9));
                empleados.add(empleado);
            }

        } catch (SQLException e){
            e.printStackTrace();
        }


        return empleados;
    }



}
